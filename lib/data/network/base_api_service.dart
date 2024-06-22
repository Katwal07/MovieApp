abstract class BaseAPiServices{

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url, dynamic data);
}