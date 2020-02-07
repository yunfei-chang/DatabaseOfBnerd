import 'package:flutter/material.dart';
import 'package:sample/model/bnerd.dart';

class BnerdTile extends StatelessWidget {

  final Bnerd bnerd;
  BnerdTile({ this.bnerd });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius:25.0,
            backgroundColor: Colors.blueGrey[200],
          ),
          title: Text(bnerd.name),
          subtitle: Text('class ${bnerd.cla} number ${bnerd.number}'),
        ),
      ),
    );
  }
}