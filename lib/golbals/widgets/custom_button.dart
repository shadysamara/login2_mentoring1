import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;
  CustomButton(this.title, this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        alignment: Alignment.center,
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 10,
                  offset: Offset(2, 5),
                  spreadRadius: 0.5)
            ],
            gradient:
                LinearGradient(colors: [Color(0xff667EEA), Color(0xff64B6FF)])),
      ),
    );
  }
}
