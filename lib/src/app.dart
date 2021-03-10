import 'package:CapstoneFinalProject/src/providers/entry_provider.dart';
import 'package:CapstoneFinalProject/src/providers/user_provider.dart';
import 'package:CapstoneFinalProject/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
        //create: (context)=>EntryProvider(),
       // create: (context)=>UserProvider(), 
         MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context)=>EntryProvider(),),
             ChangeNotifierProvider(create: (context)=>UserProvider(),)
           ],
            child: MaterialApp(
              home: HomeScreen(),
              theme: ThemeData(accentColor: Colors.pinkAccent, primaryColor: Colors.black),
          ),
        );     

  }
}