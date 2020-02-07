import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/bnerd.dart';
import 'package:sample/screen/home/bnerdTile.dart';

class Bnerdlist extends StatefulWidget {
  @override
  _BnerdlistState createState() => _BnerdlistState();
}

class _BnerdlistState extends State<Bnerdlist> {
  @override
  Widget build(BuildContext context) {

    final bnerds = Provider.of<List<Bnerd>>(context) ?? [];

    return ListView.builder(
      itemCount: bnerds.length,
      itemBuilder: (context, index) {
        return BnerdTile(bnerd: bnerds[index]);
      },
    );
  }
}