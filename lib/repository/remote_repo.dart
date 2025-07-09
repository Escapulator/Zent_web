import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typed_result/typed_result.dart';

import '../core/auth_cubit.dart';
import '../view_model/login_cubit.dart';

class Repository {
  static final Map<String, DemoUser> _fakeDemoUsers = {
    "sarah@exoai.tech": DemoUser("Sarah Adigba", "sarah@exoai.tech"),
    "demo@exoai.tech": DemoUser("Jon Snow", "demo@exoai.tech"),
  };
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<SharedPreferences> sharedPreferencesFuture =
      SharedPreferences.getInstance();

  static FirebaseFirestore db = FirebaseFirestore.instance;

  static final StreamController<UserType> moduleStreamController =
      StreamController(); // TODO: close this stream when app dies

  static final StreamController<DemoUser?> fakeAuthController =
      StreamController(); // TODO: close this stream when app dies

  static addData(Map data) async {
    // Get a document reference
    DocumentReference document = FirebaseFirestore.instance
        .collection('collection')
        .doc('demo_requests');

    // Set the data
    await document.set(data);
  }

  addWaitlistUser(Map<String, dynamic> payload) async {
    await db.collection('Waitlisted_Users').add(payload);
  }

  static Future<Result<void, String>> login(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //await auth.signInAnonymously();
      return const Ok(null);
    } on FirebaseAuthException {
      return const Err("Incorrect email or password");
    }
  }

  static Future<Result<void, String>> fakeLogin(
    String email,
    String password,
  ) async {
    try {
      var user = _fakeDemoUsers[email];
      if (user != null && password.startsWith("password")) {
        _persistFakeDemoUser(email);
        fakeAuthController.add(user);
        await Future.delayed(Duration(seconds: 1));
        return const Ok(null);
      } else {
        return const Err("Incorrect email or password");
      }
    } on FirebaseAuthException {
      return const Err("Incorrect email or password");
    }
  }

  //  static void listenForTransactions(Function onNewTransaction) {
  //     final docRef = db.collection("cities").doc("SF");
  //     docRef.snapshots().listen(
  //           (event) => onNewTransaction(),
  //           onError: (error) => debugPrint("Listen failed: $error"),
  //         );
  //   }

  //   static Future<Result<List<DemoTransaction>, String>>
  //       fetchDemoTransactions() async {
  //     try {
  //       QuerySnapshot querySnapshot = await db.collection("demo_txs").get();
  //       List<QueryDocumentSnapshot> docs = querySnapshot.docs;
  //       // List<Map<String, dynamic>> transactions =
  //       // docs.map((doc) => doc.data() as Map<String, dynamic>).toList(); // need a mapper

  //       List<DemoTransaction> transactions = docs
  //           .map((doc) =>
  //               DemoTransaction.fromJson(doc.data() as Map<String, dynamic>))
  //           .toList();
  //       debugPrint(transactions.length.toString());
  //       return Ok(transactions);
  //     } catch (e) {
  //       debugPrint('Error fetching transactions: $e');
  //       return Err(e.toString());
  //     }
  //   }

  //   static Future<Result<DemoTransaction, String>> getDemoTransaction(
  //       String transactionId) async {
  //     try {
  //       final snapShot = await db.collection("demo_txs").doc(transactionId).get();

  //       Map<String, dynamic>? elementData = snapShot.data();
  //       if (elementData == null) {
  //         return Err("Transaction does not exist");
  //       }
  //       return Ok(DemoTransaction.fromJson(elementData));
  //     } catch (e) {
  //       String errorMessage = e is String ? e : e.toString();
  //       return Err(errorMessage);
  //     }
  //   }

  //   static Future<List<Map<String, dynamic>>> fetchBlackListed(
  //       String path) async {
  //     try {
  //       QuerySnapshot querySnapshot = await db.collection(path).get();
  //       List<QueryDocumentSnapshot> docs = querySnapshot.docs;
  //       List<Map<String, dynamic>> users =
  //           docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  //       print(users);
  //       return users;
  //     } catch (e) {
  //       print('Error fetching users: $e');
  //       return [];
  //     }
  //   }

  //   static Future<Result<List<FraudRule>, String>> getFraudRules() async {
  //     try {
  //       final snapShot = await db.collection("demo_rules").get();

  //       List<FraudRule> rules = [];

  //       debugPrint(snapShot.docs.length.toString());
  //       debugPrint(snapShot.docs[0].data().toString());
  //       for (var element in snapShot.docs) {
  //         Map<String, dynamic> elementData = element.data();
  //         FraudRule data = FraudRule(
  //             elementData["addedBy"],
  //             elementData["dateCreated"],
  //             elementData["description"],
  //             elementData["isActive"],
  //             elementData["ruleId"],
  //             element.id);
  //         rules.add(data);
  //       }

  //       return Ok(rules);
  //     } catch (e) {
  //       String errorMessage = e is String ? e : e.toString();
  //       return Err(errorMessage);
  //     }
  //   }

  //   static Future<Result<void, String>> updateIsActive(
  //       String documentId, bool isActive) async {
  //     try {
  //       final documentRef = db.collection("demo_rules").doc(documentId);
  //       await documentRef.update({
  //         'isActive': isActive,
  //       });
  //       return Ok(null);
  //     } catch (e) {
  //       String errorMessage = e is String ? e : e.toString();
  //       return Err(errorMessage);
  //     }
  //   }

  //   static Future<void> addUserToBlacklist(String userId) async {
  //     try {
  //       var id = Uuid().v4();
  //       Map<String, dynamic> data = {
  //         'addedBy': "Sarah A.",
  //         'userId': userId,
  //         'createdAt': getCurrentTimeInIsoFormat(),
  //         'id': id
  //       };
  //       await db.collection("blacklisted_users").doc(id).set(data);
  //       print('Data added successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static removeFromBlackList(String path, String deviceId) async {
  //     try {
  //       await db.collection(path).doc(deviceId).delete();
  //       print('Data deleted successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static Future<void> addDeviceToBlacklist(Device device) async {
  //     try {
  //       // not the best impl. we might not be able to guarantee uniqueness of device id. but this is a demo
  //       var id = device.deviceId;
  //       Map<String, dynamic> data = {
  //         'addedBy': "Sarah A.",
  //         'deviceId': device.deviceId,
  //         'createdAt': getCurrentTimeInIsoFormat(),
  //         'os': device.osName,
  //         'manufacturer': device.manufacturer,
  //         'model': device.model,
  //         'id': id
  //       };
  //       await db.collection("blacklisted_devices").doc(id).set(data);
  //       print('Data added successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static addReviewStateToTransaction(
  //       String transactionId, bool approval) async {
  //     try {
  //       Map<String, dynamic> data = {
  //         "transactionReview": {
  //           'isApproved': approval,
  //           'reviewDate': getCurrentTimeInIsoFormat(),
  //           'reviewerId': "sruthi_d",
  //           'reviewerName': "Sruthi D."
  //         }
  //       };
  //       await db.collection("demo_txs").doc(transactionId).update(data);
  //       print('review updated successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static Future<void> addAccountToBlacklist(
  //       String accountNumber, AccountType accountType) async {
  //     try {
  //       var id = Uuid().v4();
  //       Map<String, dynamic> data = {
  //         'addedBy': "Sarah A.",
  //         'accountNumber': accountNumber,
  //         'createdAt': getCurrentTimeInIsoFormat(),
  //         'accountType': accountType.name,
  //         'id': id
  //       };
  //       await db.collection("blacklisted_accounts").doc(id).set(data);
  //       print('Data added successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static Future<void> addRule(String description) async {
  //     try {
  //       Map<String, dynamic> data = {
  //         'author': FirebaseAuth.instance.currentUser?.uid.toString() ?? "",
  //         'description': description,
  //         'createdAt': getCurrentTimeInIsoFormat(),
  //         'id': Uuid().v4()
  //       };
  //       await db.collection("fraud_rules").add(data);
  //       print('Data added successfully!');
  //     } catch (e) {
  //       print('Error adding data: $e');
  //     }
  //   }

  //   static void setupDio() {
  //     dio.interceptors.add(LogInterceptor(
  //         request: true,
  //         requestHeader: true,
  //         requestBody: true,
  //         responseBody: true));
  //   }

  //   static Future<void> saveTransactionIdTemp(String transactionId) async {
  //     var sharedPrefs = await sharedPreferencesFuture;
  //     await sharedPrefs.setString("temp_transaction_id", transactionId);
  //   }

  //   static Future<String> getTempTransactionId() async {
  //     var sharedPrefs = await sharedPreferencesFuture;
  //     return sharedPrefs.getString("temp_transaction_id") ?? "";
  //   }

  //   static Future<void> saveTransactionTemp(_Response_.Transaction t) async {
  //     var sharedPrefs = await sharedPreferencesFuture;
  //     await sharedPrefs.setString("temp_transaction", jsonEncode(t));
  //   }

  //   static Future<_Response_.Transaction?> getTempTransaction() async {
  //     var sharedPrefs = await sharedPreferencesFuture;
  //     var raw = sharedPrefs.getString("temp_transaction") ?? "";
  //     if (raw.isEmpty) return null;
  //     return _Response_.Transaction.fromJson(jsonDecode(raw));
  //   }

  static Future<UserType> getCurrentExoModule() async {
    var sharedPrefs = await sharedPreferencesFuture;
    String? moduleAsStr = sharedPrefs.getString("exo_module");

    if (moduleAsStr == UserType.user.name) {
      return UserType.user;
    }

    return UserType.traveller;
  }

  static Future<void> setCurrentModule(UserType module) async {
    var sharedPrefs = await sharedPreferencesFuture;
    await sharedPrefs.setString("exo_module", module.name);
    moduleStreamController.add(module);
  }

  static Future<DemoUser?> initDemoUser() async {
    var sharedPrefs = await sharedPreferencesFuture;
    var email = sharedPrefs.getString("demo_user");
    return _fakeDemoUsers[email];
  }

  static void _persistFakeDemoUser(String email) async {
    var sharedPrefs = await sharedPreferencesFuture;
    sharedPrefs.setString("demo_user", email);
  }

  static void clearDemoUser() async {
    var sharedPrefs = await sharedPreferencesFuture;
    sharedPrefs.remove("demo_user");
    fakeAuthController.add(null);
  }
}
