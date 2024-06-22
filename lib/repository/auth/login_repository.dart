import 'package:movie_app/configs/urls/app_urls.dart';
import 'package:movie_app/data/network/network_api_service.dart';
import 'package:movie_app/model/user/user_model.dart';

class LoginRepository{
  final _api = NetworkApiService();
  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.postApi(AppUrls.loginApiUrl, data);
    // converts the JSON response from the server into UserModel Object
    return UserModel.fromJson(response);
  }
}