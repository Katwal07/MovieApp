import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/repository/auth/login_repository.dart';
import 'package:movie_app/services/session_manager/sesson_controller.dart';

import '../../utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

// {
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
// }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
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

  
    await loginRepository.loginApi(data).then((value) async{
      if (value.error!.isNotEmpty) {
      emit(state.copyWith(
        message: value.error,
        loginStatus: LoginStatus.error,
      ));
    } else {
      await SessionController().saveUserInPreference(value);
      await SessionController().getuserFromPreference();
      emit(state.copyWith(
        message: value.token,
        loginStatus: LoginStatus.success,
      ));
    }
    });

    
  } 
}
