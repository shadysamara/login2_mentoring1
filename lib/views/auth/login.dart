import 'package:flutter/material.dart';
import 'package:mentor/core/db/db_helper.dart';
import 'package:mentor/core/db/modles/user.dart';
import 'package:mentor/golbals/widgets/custom_button.dart';
import 'package:mentor/golbals/widgets/custom_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor/core/navigation_service/navigation_service.dart';
import 'package:mentor/views/auth/sign_up.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  String password;
  saveEmail(String value) {
    this.email = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  validateFun(String email) {
    if (email.length < 5) {
      return 'Error';
    }
  }

  saveForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      DBHelper.dbHelper.selectUser(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: [
                            TextSpan(text: 'Welcome to '),
                            TextSpan(
                                text: 'Bolt',
                                style: TextStyle(fontWeight: FontWeight.w600))
                          ]),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Image.asset('assets/Image.png'),
                    SizedBox(
                      height: 80.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomTextfield(
                            label: 'Email',
                            save: saveEmail,
                            validator: validateFun,
                            isPassword: false,
                          ),
                          CustomTextfield(
                              label: 'Password',
                              save: savePassword,
                              validator: validateFun,
                              isPassword: true),
                          SizedBox(
                            height: 50.h,
                          ),
                          CustomButton('LOGIN', saveForm),
                          SizedBox(
                            height: 15.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationService.navigationService
                                  .navigateAndReplaceWidget(SignUpPage());
                            },
                            child: Text(
                              'DONT HAVE AN ACCOUNT',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
