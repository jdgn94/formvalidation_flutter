import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';

import 'src/blocks/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: "login",
        routes: {
          "login" : (BuildContext context) => LoginPage(),
          "home" : (BuildContext context) => HomePage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}