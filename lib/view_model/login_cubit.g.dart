// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState email(String email);

  LoginState emailError(String? emailError);

  LoginState password(String password);

  LoginState passwordError(String? passwordError);

  LoginState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    String email,
    String? emailError,
    String password,
    String? passwordError,
    bool isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState email(String email) => this(email: email);

  @override
  LoginState emailError(String? emailError) => this(emailError: emailError);

  @override
  LoginState password(String password) => this(password: password);

  @override
  LoginState passwordError(String? passwordError) =>
      this(passwordError: passwordError);

  @override
  LoginState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? email = const $CopyWithPlaceholder(),
    Object? emailError = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? passwordError = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
      email:
          email == const $CopyWithPlaceholder()
              ? _value.email
              // ignore: cast_nullable_to_non_nullable
              : email as String,
      emailError:
          emailError == const $CopyWithPlaceholder()
              ? _value.emailError
              // ignore: cast_nullable_to_non_nullable
              : emailError as String?,
      password:
          password == const $CopyWithPlaceholder()
              ? _value.password
              // ignore: cast_nullable_to_non_nullable
              : password as String,
      passwordError:
          passwordError == const $CopyWithPlaceholder()
              ? _value.passwordError
              // ignore: cast_nullable_to_non_nullable
              : passwordError as String?,
      isLoading:
          isLoading == const $CopyWithPlaceholder()
              ? _value.isLoading
              // ignore: cast_nullable_to_non_nullable
              : isLoading as bool,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
