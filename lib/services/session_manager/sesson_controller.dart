import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/user/user_model.dart';
import 'package:movie_app/services/storage/local_storage.dart';

class SessionController{

  static final SessionController _sessionController = SessionController._internal();

  final LocalStorage localStorage = LocalStorage();
  static UserModel userModel = UserModel();
  bool? isLogin;
  SessionController._internal(){
    isLogin = false;
  }

  factory SessionController(){
    return _sessionController;
  }

  Future<void> saveUserInPreference (dynamic userModel) async{
    localStorage.setValue('token', jsonEncode(userModel));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getuserFromPreference() async{
    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if(userData.isNotEmpty){
        SessionController.userModel = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    }catch(e){
      debugPrint(e.toString());
    }
  }
}