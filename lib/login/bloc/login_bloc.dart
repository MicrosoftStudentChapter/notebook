import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authRepository}) : super(const Unauthenticated()) {
    on<SignInEvent>((event, emit) async {
      emit(const SignInLoading());
      try {
        final result = await authRepository.signInwithGoogle();
        emit(SignInSuccess(result.toString()));
      } catch (e) {
        print(e);
        if (e is FirebaseAuthException) {
          emit(SignInError(e.message!));
          print(e.message);
          emit(const Unauthenticated());
        }
      }
    });
  }
  final AuthRepository authRepository;
}
