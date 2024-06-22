import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/repository/auth/login_repository.dart';

import '../../utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
  emit(state.copyWith(loginStatus: LoginStatus.loading));

  Map<String, String> data = {
    'email': state.email,
    'password': state.password,
  };

  try {
    final user = await loginRepository.loginApi(data);

    if (user.error != null && user.error!.isNotEmpty) {
      emit(state.copyWith(
        message: user.error,
        loginStatus: LoginStatus.error,
      ));
    } else {
      emit(state.copyWith(
        message: user.token,
        loginStatus: LoginStatus.success,
      ));
    }
  } catch (error) {
    emit(state.copyWith(
      message: error.toString(),
      loginStatus: LoginStatus.error,
    ));
  }
}
}