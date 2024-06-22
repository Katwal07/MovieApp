part of 'splash_service_imports.dart';

class SplashService{

  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3), () => 
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false)
    );
  }
}