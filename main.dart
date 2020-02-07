import 'package:sample/model/user.dart';
import 'package:sample/screen/home/wrapper.dart';
import 'package:sample/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:Authservice().user,
    child: MaterialApp(
     home: Wrapper(),
    ),
    );
  }
}
