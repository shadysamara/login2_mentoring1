import 'dart:convert';

import 'package:mentor/core/navigation_service/navigation_service.dart';
import 'package:mentor/views/splach/splach_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();
  SharedPreferences sharedPreferences;
  Future<SharedPreferences> initSharedPrefences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }

  setUserEmail(String email) {
    sharedPreferences.setString('email', email);
  }

  bool getUserEmail(String email) {
    String email = sharedPreferences.getString('email');
    if (email == null) {
      return false;
    } else {
      return true;
    }
  }

  logOut() async {
    await sharedPreferences.clear();
    NavigationService.navigationService
        .navigateAndReplaceWidget(SplachScreen());
  }
}
