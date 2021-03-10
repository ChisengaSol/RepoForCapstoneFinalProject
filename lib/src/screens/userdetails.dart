import 'package:CapstoneFinalProject/src/models/user.dart';
import 'package:CapstoneFinalProject/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatefulWidget {
  final User user;
  UserDetails({this.user});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final userController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (widget.user != null) {
      //edit
      userController.text = widget.user.userName;
      //userController.text = widget.user.gender;
    } else {
      //add
      userProvider.loadAllUserEntries(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('My user details'),
        ),
        body: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: InputBorder.none,
              ),
              maxLines: 12,
              minLines: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: InputBorder.none,
              ),
              maxLines: 12,
              minLines: 10,
            ),
            RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  userProvider.saveUserEntry();
                  //Navigator.of(context).pop();
                }),
          ],
        ));
  }
}
