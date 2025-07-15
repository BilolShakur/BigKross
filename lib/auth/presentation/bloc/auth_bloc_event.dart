part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class AuthLoginWithEmail extends AuthBlocEvent {
  final String email;
  final String password;
  AuthLoginWithEmail({required this.email, required this.password});
}

class AuthRegisterWithEmail extends AuthBlocEvent {
  final String email;
  final String password;
  AuthRegisterWithEmail({required this.email, required this.password});
}

class AuthLoginGoogle extends AuthBlocEvent {}

class SendOtp extends AuthBlocEvent {
  final String phoneNumber;
  SendOtp({required this.phoneNumber});
}

class AuthVerifyOtp extends AuthBlocEvent {
  final String vId;
  final String smsCode;
  AuthVerifyOtp({required this.vId, required this.smsCode});
}

class Logout extends AuthBlocEvent {}
