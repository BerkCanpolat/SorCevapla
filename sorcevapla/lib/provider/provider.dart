import 'package:flutter/material.dart';
import 'package:sorcevapla/model/user_model.dart';
import 'package:sorcevapla/service/auth.dart';

class ProjectProvider with ChangeNotifier {
  UserModel? _userModel;

  UserModel? get getUser => _userModel;


  Future<void> userProviderDetails() async{
    _userModel = await AuthMethod().userDetails();
    notifyListeners();
  }
}