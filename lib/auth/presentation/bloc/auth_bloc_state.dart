part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

class AuthLoading extends AuthBlocState {}

class AuthDone extends AuthBlocState {}

class AuthErrorState extends AuthBlocState {
  final String massage;
  AuthErrorState({required this.massage});
}

class otpSend extends AuthBlocState {
  final String vId;
  otpSend({required this.vId});
}

class OtpAuthVerificationSuccsesState extends AuthBlocState {}

class OtpAuthVerificationError extends AuthBlocState {
  final String error;
  OtpAuthVerificationError({
    required this.error,
  });
}
