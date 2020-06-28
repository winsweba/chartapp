
import 'package:chartapp/widget/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: <Widget>[
            TextField(
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration('Email') ,
            ),
            TextField(
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration('Password')
            ),
            SizedBox(height: 8,),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Forgot Password',style: simpleTextStyle(),),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff007ef4),
                    const Color(0xff2a75bc),
                  ],
                ),
              ),
              child: Text('Sig In', style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
