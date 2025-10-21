import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlytauca/features/auth/data/repositories/auth_repository.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository;

  SigninBloc({required this.authRepository}) : super(SigninInitial()) {
    on<SignInButtonPressed>((event, emit) async {
      emit(SigninLoading());
      try {
        final response = await authRepository.signIn(event.username, event.password);
        if (response.statusCode == 200) {
          emit(SigninSuccess());
        } else {
          emit(SigninFailure(error: 'Đăng nhập thất bại: ${response.body}'));
        }
      } catch (e) {
        emit(SigninFailure(error: e.toString()));
      }
    });
  }
}
