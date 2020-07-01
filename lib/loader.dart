import 'package:flutter/material.dart';

class lazy_loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(boxShadow: []),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/loader.jpg"),
                radius: 60,
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
