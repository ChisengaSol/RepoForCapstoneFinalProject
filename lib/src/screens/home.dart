import 'package:CapstoneFinalProject/src/models/entry.dart';
import 'package:CapstoneFinalProject/src/models/user.dart';
import 'package:CapstoneFinalProject/src/providers/entry_provider.dart';
import 'package:CapstoneFinalProject/src/providers/user_provider.dart';
import 'package:CapstoneFinalProject/src/screens/entry.dart';
import 'package:CapstoneFinalProject/src/screens/main_drawer.dart';
import 'package:CapstoneFinalProject/src/screens/userdetails.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My journal'),
      ),

      //sidebar menu
      drawer: MainDrawer(),

      //display items on home screen
      body: Column(children: [Expanded(
        
          child: StreamBuilder<List<Entry>>(
            stream: entryProvider.entries,
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Icon(
                        Icons.edit,
                      ),
                      title: Text(
                        formatDate(
                          DateTime.parse(snapshot.data[index].date),
                          [MM, ' ', d, ', ', yyyy],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EntryScreen(
                                  entry: snapshot.data[index],
                                )));
                      },
                    );
                  });
            }),
        ),
        Container()       

      ],),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EntryScreen()));
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => UserDetails()));
        },
      ),
  
    );
  }
}
