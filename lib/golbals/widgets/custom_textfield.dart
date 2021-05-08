import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  String label;
  Function validator;
  Function save;
  bool isPassword;
  CustomTextfield(
      {this.isPassword = false, this.label, this.save, this.validator});

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      validator: (value) => widget.validator(value),
      onSaved: (value) => widget.save(value),
      decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    widget.isPassword = !this.widget.isPassword;
                    setState(() {});
                  },
                )
              : Container(
                  width: 0,
                )),
    );
  }
}
