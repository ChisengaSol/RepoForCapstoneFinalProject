/*This is a class for the side bar menu */

import 'package:CapstoneFinalProject/src/screens/info.dart';
import 'package:CapstoneFinalProject/src/screens/userdetails.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          //top header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                        ),
                        fit: BoxFit.fill,
                      ), //NetworkImage() function is used to provide image from internet
                    ),
                  ),
                  //username
                  Text(
                    'Tony\'s Wife',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //other pages on sidebar
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'My details',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDetails()),
              );
            }, //currently do nothing when tapped
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'My favourite tutor',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FavoriteTutorsScreen()),
              // );
            }, //currently do nothing when tapped
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoScreen()),
              );
            }, //currently do nothing when tapped
          ),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Log out',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // auth.signOut();
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
              } //currently do nothing when tapped
              ),
        ],
      ),
    );
  }
}
