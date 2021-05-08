import 'package:flutter/material.dart';
import 'package:mentor/core/sp/sp_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                SPHelper.spHelper.logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
