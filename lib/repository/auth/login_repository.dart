import 'package:movie_app/model/user/user_model.dart';

abstract class LoginRepository{
  Future<UserModel> loginApi(dynamic data);
  }