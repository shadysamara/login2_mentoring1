import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor/core/navigation_service/navigation_service.dart';
import 'package:mentor/core/sp/sp_helper.dart';
import 'package:mentor/views/auth/login.dart';
import 'package:mentor/views/splach/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.spHelper.initSharedPrefences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 835),
        builder: () => MaterialApp(
              navigatorKey: NavigationService.navigationService.navigatorKey,
              title: 'Flutter Demo',
              home: SplachScreen(),
            ));
  }
}
