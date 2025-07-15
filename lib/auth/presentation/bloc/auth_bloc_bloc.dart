import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:big_g_kross/auth/data/auth_reposotory.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(AuthBlocInitial()) {
    on<AuthLoginWithEmail>(_onLoginWithEmail);
    on<AuthRegisterWithEmail>(_onRegisterViaEmail);
    on<AuthLoginGoogle>(_onGoogLogin);
    on<SendOtp>(_onOtpSend);
    on<Logout>(_LogOut);
    on<AuthVerifyOtp>(_onOtpVerification);
  }

  Future<void> _onLoginWithEmail(
    AuthLoginWithEmail event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final user = await repo.loginWithEmail(event.email, event.password);

      if (user != null) {
        emit(AuthDone());
      } else {
        emit(AuthErrorState(massage: 'error accrued try again later'));
      }
    } catch (e) {
      emit(AuthErrorState(massage: e.toString()));
    }
  }

  Future<void> _onRegisterViaEmail(
    AuthRegisterWithEmail event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await repo.registerWithEmail(event.email, event.password);
      if (user == null) {
        emit(AuthErrorState(massage: "Error accrued try again"));
      } else {
        emit(AuthDone());
      }
    } catch (e) {
      emit(AuthErrorState(massage: "Error accrued try again"));
    }
  }

  Future<void> _onGoogLogin(
    AuthLoginGoogle event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await repo.loginWithGoogle();
      if (user == null) {
        emit(AuthErrorState(massage: "Error accrued try again"));
      } else {
        emit(AuthDone());
      }
    } catch (e) {
      emit(AuthErrorState(massage: "Error accrued try again"));
    }
  }

  Future<void> _onOtpSend(SendOtp event, Emitter<AuthBlocState> emit) async {
    try {
      emit(AuthLoading());
      await repo.sendOtp(
        phoneNumber: event.phoneNumber,
        onCodeSent: (verificationId) {
          emit(otpSend(vId: verificationId));
        },
        onError: (error) {
          emit(AuthErrorState(massage: error.message ?? "Failed to send OTP"));
        },
      );
    } catch (e) {
      emit(AuthErrorState(massage: "Error accrued try again"));
    }
  }

  Future<void> _onOtpVerification(
    AuthVerifyOtp event,
    Emitter<AuthBlocState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final user = await repo.verifyOtp(
        verificationId: event.vId,
        smsCode: event.smsCode,
      );

      if (user != null) {
        emit(OtpAuthVerificationSuccsesState());
      } else {
        emit(OtpAuthVerificationError(error: "OTP verification failed"));
      }
    } catch (e) {
      emit(OtpAuthVerificationError(error: "Error occurred, try again"));
    }
  }

  Future<void> _LogOut(Logout event, Emitter<AuthBlocState> emit) async {
    try {
      emit(AuthLoading());
      await repo.logout();
      emit(AuthDone());
    } catch (e) {
      emit(AuthErrorState(massage: "Error occurred, try again"));
    }
  }
}
