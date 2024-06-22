part of 'routes_imports.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
      return MaterialPageRoute(builder: (context) => const SplashView());

      case RoutesName.home:
      return MaterialPageRoute(builder: (context) => const MovieView());

      case RoutesName.login:
      return MaterialPageRoute(builder: (context) => const LoginView());

      case RoutesName.register:
      return MaterialPageRoute(builder: (context)=> const RegisterView());

      default:
      return MaterialPageRoute(builder: (_){
        return const Scaffold(
          body: Center(
            child: Text('No Route Defined'),
          ),
        );
      });
    }
  }
}