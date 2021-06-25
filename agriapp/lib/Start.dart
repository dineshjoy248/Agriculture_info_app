import 'package:flutter/material.dart';
import 'package:agriapp/Login.dart';
import 'SignUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin()async{

     Navigator.pushReplacementNamed(context, "Login");
  }

   navigateToRegister()async{

     Navigator.pushReplacementNamed(context, "SignUp");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            SizedBox(height: 25.0),

            Container(
              height: 300,

              child: Image(image: AssetImage("assets/111.jpg"),
              fit: BoxFit.contain,
              ),
            ),

            SizedBox(height : 15),

            RichText(
              
              text: TextSpan(
                text: 'Welcome to ', style: TextStyle(
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.black
                ),

                children: <TextSpan>[
                  TextSpan(
                    text: 'Our App', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.green)
                  )
                ]
              ) 
            ),
            SizedBox(height: 8.0),

            Text('A Completer Agriculture information provided',style: TextStyle(color:Colors.black),),

            SizedBox(height: 25.0),


            Row( mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                RaisedButton(
                  padding: EdgeInsets.only(left:30,right:30),
                  
                  onPressed: navigateToLogin,
                  child: Text('LOGIN',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.green
                ),

                SizedBox(width:20.0),

                RaisedButton(
                  padding: EdgeInsets.only(left:30,right:30),
                  
                  onPressed: navigateToRegister,
                  child: Text('REGISTER',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.green
                ),

              ],
            ),

          ],
        ),
      ),
      
    );
  }
}