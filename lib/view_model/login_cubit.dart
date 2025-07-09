import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:typed_result/typed_result.dart';

import '../repository/remote_repo.dart';
import '../utils/action_state.dart';
import '../utils/extensions.dart';

part 'login_cubit.g.dart';

// Define the enum with two values: Euclid and Fibonacci
enum UserType { user, traveller }

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  final StreamController<ActionState<LoginScreenAction>>
  _actionStateController = StreamController();

  StreamController<ActionState<LoginScreenAction>> actionState() =>
      _actionStateController;

  void onEmailEntered(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordEntered(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> onLoginClicked() async {
    debugPrint(state.password);
    debugPrint(state.email);

    emit(state.copyWith(emailError: null, passwordError: null));

    List<String> errors = [];

    if (!validateEmail(state.email)) {
      errors.add("Enter a valid email");
    }

    if (state.password.length < 6) {
      errors.add("Enter a valid password of at least 6 characters");
    }

    if (errors.isEmpty) {
      emit(state.copyWith(isLoading: true));

      var loginResult = await Repository.fakeLogin(state.email, state.password);

      emit(state.copyWith(isLoading: false));

      if (!loginResult.isSuccess) {
        _showError(loginResult.getError().orEmpty());
      } else {
        Repository.setCurrentModule(UserType.user);
        // Automatically handled by the authListener in main.dart
      }
    } else {
      _showError(errors.first);
    }
  }

  void _showError(String message) {
    _actionStateController.add(ActionState.of(ShowError(message: message)));
  }

  void onForgotPasswordClicked() {
    debugPrint("forgot pass clicked");
    _actionStateController.add(ActionState.of(NavToForgotPass()));
  }

  void onSignupClicked() {
    _actionStateController.add(ActionState.of(NavToSignUp()));
  }

  @override
  Future<void> close() {
    _actionStateController.close();
    return super.close();
  }
}

abstract class LoginScreenAction {}

class NavToForgotPass extends LoginScreenAction {}

class NavToSignUp extends LoginScreenAction {}

class ShowError extends LoginScreenAction {
  String message;

  ShowError({required this.message});
}

@CopyWith()
class LoginState {
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;
  final bool isLoading;

  factory LoginState.initial() => LoginState(
    email: kDebugMode ? "hamza@fetu.ga" : "",
    password: kDebugMode ? "password" : "",
    isLoading: false,
    emailError: null,
    passwordError: null,
  );

  LoginState({
    required this.email,
    required this.emailError,
    required this.password,
    required this.passwordError,
    required this.isLoading,
  });
}
