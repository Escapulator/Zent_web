import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

extension ContextExt on BuildContext {
  Future<void> showMyDialog(
    String title,
    String message,
    String buttonText,
    bool dismissible, {
    Function? onActionClick,
  }) async {
    return showDialog<void>(
      context: this,
      barrierDismissible: dismissible, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: SelectableText(title),
          content: SingleChildScrollView(
            child: ListBody(children: <Widget>[SelectableText(message)]),
          ),
          actions: <Widget>[
            TextButton(
              child: SelectableText(buttonText),
              onPressed: () {
                if (onActionClick == null) {
                  context.pop();
                } else {
                  onActionClick();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void hideKeyboardIfAndroid() {
    if (Theme.of(this).platform == TargetPlatform.android) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  Color onPrimaryColor() {
    return Theme.of(this).colorScheme.onPrimary;
  }

  Color onSurfaceColor() {
    return Theme.of(this).colorScheme.onSurface;
  }

  Color onBackgroundColor() {
    return Theme.of(this).colorScheme.onSurface;
  }

  Color primaryColor() {
    return Theme.of(this).colorScheme.primary;
  }

  Color onTertiaryColor() {
    return Theme.of(this).colorScheme.onTertiary;
  }

  Color backgroundColor() {
    return Theme.of(this).colorScheme.surface;
  }

  void showSnackBar(
    String message, {
    Duration duration = const Duration(milliseconds: 4000),
    double? width,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();

    SnackBar snackBar = SnackBar(
      duration: duration,
      behavior: SnackBarBehavior.floating,
      width: width,
      content: SelectableText(message),
      action: SnackBarAction(
        label: 'ok',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  // String simpleCurrencySymbol(String currencyCode) {
  //   return NumberFormat
  //       .simpleCurrency(
  //       locale: Localizations.localeOf(this).toString(),
  //       name: currencyCode
  //   )
  //       .currencySymbol;
  // }
}

// extension ResponseExt on Response {
//
//   bool isSuccess() {
//     if (statusCode == null) return false;
//     return statusCode! >= 200 && statusCode! < 300;
//   }
//
//   void log() {
//     print('''
//     -------------------------------
//       code: $statusCode,
//       data: ${data.toString()}
//     -------------------------------
//         ''');
//   }
//
//   String extractMessage() {
//     try {
//       return data["message"];
//     } catch (e) {
//       // TODO: log to crashlytics
//       return data.toString();
//     }
//   }
// }

// extension ResponseNullableExt on Response? {
//
//   String asMessage() {
//     if (this != null) return this!.extractMessage();
//     return "";
//   }
//
// }

String formatIsoDateString(String dateString) {
  if (dateString.isEmpty) return dateString;
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat.yMMMd().add_Hm().format(dateTime);
}

String formatDateString(String dateString) {
  if (dateString.isEmpty) return dateString;
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat.MMMd().add_Hm().format(dateTime);
}

String getCurrentTimeInIsoFormat() {
  DateTime now = DateTime.now().toUtc();
  String formattedTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now);
  return formattedTime;
}

extension StringExt on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String decommarise() {
    return replaceAll(',', '');
  }

  // String commarise() {
  //   final formatter = NumberFormat('#,##0.00');
  //   final doubleValue = double.tryParse(replaceAll(',', ''));
  //   if (doubleValue == null) {
  //     return '';
  //   }
  //   String formattedStr = formatter.format(doubleValue);
  //   return formattedStr.endsWith('.00') ? formattedStr.substring(
  //       0, formattedStr.length - 3) : formattedStr;
  // }

  String pluraliseWithS(int count) {
    if (count == 1) return this;
    return "${this}s";
  }
}

// void launchAppOnPlayStore(String appId) async {
//   final url = 'https://play.google.com/store/apps/details?id=$appId';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

String? extractAppIdFromPlayStoreLink(String link) {
  final regex = RegExp(r'id=([a-zA-Z0-9\.]+)');
  final match = regex.firstMatch(link);
  if (match != null && match.groupCount >= 1) {
    return match.group(1);
  } else {
    return null;
  }
}

void handleProductClick(String link) async {
  var appId = extractAppIdFromPlayStoreLink(link);

  if (appId == null) {
    return;
  }

  const platform = MethodChannel('hf.best_rates/appLauncher');

  var args = {'appId': appId};
  var isInstalled = await platform.invokeMethod("isInstalled", args);

  if (isInstalled) {
    await platform.invokeMethod("launchApp", args);
  } else {
    await platform.invokeMethod("launchPlayStore", args);
  }
}

Future<String> getProductButtonTitle(String link) async {
  if (Platform.isIOS) {
    return "download";
  }
  var appId = extractAppIdFromPlayStoreLink(link);

  if (appId == null) {
    return "download";
  }

  const platform = MethodChannel('hf.best_rates/appLauncher');

  var args = {'appId': appId};

  var isInstalled = await platform.invokeMethod("isInstalled", args);

  return isInstalled ? "launch" : "download";
}

// void launchThisUrl(String url) async {
//   Uri? uri = Uri.tryParse(url);
//   if (uri == null) return;
//
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// bool shouldShowAppDownload(Links links) {
//   if (defaultTargetPlatform == TargetPlatform.android) {
//     return links.android != null;
//   }
//
//   if (defaultTargetPlatform == TargetPlatform.iOS) {
//     return links.ios != null;
//   }
//
//   return false;
// }

extension NullStringExt on String? {
  bool isNullOrEmpty() {
    if (this == null) return true;
    if (this!.isEmpty) return true;
    return false;
  }

  String orEmpty() {
    if (this == null) return "";
    return this!;
  }
}

bool isModalVisible(BuildContext context) {
  return ModalRoute.of(context)?.isCurrent ?? false;
}

bool validateEmail(String email) {
  // Regular expression for validating email addresses
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );

  // Check if the email matches the regular expression
  return emailRegex.hasMatch(email);
}

// String simpleCurrencySymbol(String currencyCode) {
//   String currency = NumberFormat
//       .simpleCurrency(
//       locale: null,
//       name: currencyCode
//   )
//       .currencySymbol;
//   return currencyCode == "CAD" ? "Can$currency" : currency;
// }
