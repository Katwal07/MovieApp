import 'package:movie_app/model/user/user_model.dart';
import 'package:movie_app/repository/auth/login_repository.dart';

class LoginHttpRepository implements LoginRepository{

  @override
  Future<UserModel> loginApi(dynamic data)async{
    await Future.delayed(const Duration(seconds: 2));
    final response = {
      'token': 'abcdef'
    };
    // converts the JSON response from the server into UserModel Object
    // and Use the data in your application
    return UserModel.fromJson(response);
  }
}