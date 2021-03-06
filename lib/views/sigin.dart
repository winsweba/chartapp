
import 'package:chartapp/widget/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -50,
          alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff007ef4),
                          const Color(0xff2a75bc),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text('Sig In', style: mediumTextStyle(),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text('Sig In With Google', style:TextStyle(
                      color:  Colors.black,
                      fontSize: 17,
                    ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? ", style: mediumTextStyle(),),
                      GestureDetector(
                        onTap: (){
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Register now",style: TextStyle(
                            color:  Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
