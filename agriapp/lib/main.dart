import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'SignUp.dart';
import 'Start.dart';
import 'package:agriapp/navigation/infowindow.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // running the app
  runApp(
    ChangeNotifierProvider(
     create:(context)=>Infowindow(),
      child: MyApp()),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{

        "Login":(BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "Start":(BuildContext context)=>Start()


      },
    );
  }
}











