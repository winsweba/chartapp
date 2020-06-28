import 'package:flutter/material.dart';

Widget appBarMain (BuildContext context){
  return AppBar(
    title:Text('Chat App'),
  );
}

InputDecoration textFieldInputDecoration(Stream hintText){
  return InputDecoration(
      hintText: 'Email',
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide:  BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      )
  );
}