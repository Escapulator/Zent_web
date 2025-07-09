import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repository/remote_repo.dart';
import '../view_model/login_cubit.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    // initFirebaseAuth();
    initFakeAuth();
    listenForFakeAuth();
    listenForModuleChanges();
  }

  void listenForModuleChanges() {
    Repository.moduleStreamController.stream.listen((event) {
      debugPrint("${event.name} selected");
      if (state is AuthenticatedState) {
        var user = (state as AuthenticatedState).user;
        emit(AuthenticatedState(user: user, userType: event));
      }
    });
  }

  Future<void> listenForFakeAuth() async {
    Repository.fakeAuthController.stream.listen((event) async {
      if (event == null) {
        emit(UnAuthenticatedState());
      } else {
        debugPrint("User is authenticated: $event");
        // ExoModule module = await Repository.getCurrentExoModule();
        emit(AuthenticatedState(user: event, userType: UserType.user));
      }
    });
  }

  void initFirebaseAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        emit(UnAuthenticatedState());
        debugPrint('User is currently signed out!');
      } else {
        UserType module = await Repository.getCurrentExoModule();
        emit(
          AuthenticatedState(
            user: DemoUser(user.displayName ?? "", user.email!),
            userType: module,
          ),
        );
        debugPrint('User is signed in!');
      }
    });
  }

  Future<void> onLogOutClicked() async {
    Repository.clearDemoUser();
    // await FirebaseAuth.instance.signOut();
  }

  void initFakeAuth() async {
    var user = await Repository.initDemoUser();
    Repository.fakeAuthController.add(user);
  }
}

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final DemoUser user;
  final UserType userType;

  AuthenticatedState({required this.user, required this.userType});
}

class UnAuthenticatedState extends AuthState {}

class DemoUser {
  final String name;
  final String email;

  DemoUser(this.name, this.email);
}




// class Authenticated extends AuthState {}

// class Unauthenticated extends AuthState {}

// class Loading extends AuthState {}



// TODO: session interceptor
// {"status":{"code":211,"description":"Unauthenticated. Session expired. Please log in again"}}
// maybe adding it here (on init) will be better, so I have access to the cubit