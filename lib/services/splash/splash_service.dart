part of 'splash_service_imports.dart';

class SplashService {
  void isLogin(BuildContext context) {
    SessionController().getuserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.home, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.login, (route) => false));
      }
    }).onError((error, stackTrace) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.login, (route) => false));
    });
  }
}
