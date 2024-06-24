import 'package:movie_app/configs/urls/app_urls.dart';
import 'package:movie_app/data/network/network_api_service.dart';
import 'package:movie_app/model/user/user_model.dart';
import 'package:movie_app/repository/auth/login_repository.dart';

class LoginHttpRepository implements LoginRepository{
  final _api = NetworkApiService();
  
  @override
  Future<UserModel> loginApi(dynamic data)async{
    final responseData = await _api.postApi(AppUrls.loginApiUrl, data);
    // converts the JSON response from the server into UserModel Object
    // and Use the data in your application
    return UserModel.fromJson(responseData);
  }
}