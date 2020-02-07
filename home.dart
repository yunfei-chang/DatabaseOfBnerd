import 'package:sample/screen/home/settingsForm.dart';
import 'package:sample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:sample/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sample/screen/home/bnerdlist.dart';
import 'package:sample/model/bnerd.dart';
class Home extends StatelessWidget {

  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context,builder: (context) {
        return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: SettingsForm(),
        );  
      });

    }

    return StreamProvider<List<Bnerd>>.value(
        value: DataBaseService().users,
        child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Bnerd'),
          backgroundColor: Colors.blueGrey[200],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('log out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Bnerdlist(),
      ),
    );
  }
}