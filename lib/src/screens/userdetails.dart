import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My user details'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('These are my details',),
            //RaisedButton(onPressed: null)
          ],
        ),

      ),
    );
  }
}