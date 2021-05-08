import 'package:flutter/material.dart';
import 'package:mentor/core/navigation_service/navigation_service.dart';
import 'package:mentor/core/sp/sp_helper.dart';
import 'package:mentor/views/auth/login.dart';
import 'package:mentor/views/home/home.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      bool isRegister = SPHelper.spHelper.getUserEmail('email');
      if (isRegister) {
        NavigationService.navigationService
            .navigateAndReplaceWidget(HomePage());
      } else {
        NavigationService.navigationService
            .navigateAndReplaceWidget(LoginPage());
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
          'Splach',
          style: TextStyle(fontSize: 30, fontFamily: 'Raleway'),
        ),
      ),
    );
  }
}
