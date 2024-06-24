import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/configs/routes/routes_imports.dart';
import 'package:movie_app/configs/routes/routes_name.dart';
import 'package:movie_app/repository/auth/login_http_api_repository.dart';
import 'package:movie_app/repository/auth/login_repository.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpRepository());
}
