import 'package:chartapp/services/database.dart';
import 'package:chartapp/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods   databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text)
        .then((val){

      setState(() {
        searchSnapshot = val;
      });
    });
  }

  // Create Chart Rome,  send user to conversation screen
//  createChartRoomAnStartConversation(){
//    List<String> users = [];
//    databaseMethods.createChatRoom();
//  }

  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index){

          return SearchTile(
            userName: searchSnapshot.documents[index].data["name"],
            userEmail: searchSnapshot.documents[index].data["email"],
          );

        }) : Container();
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16 ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: 'search username...',
                          hintStyle: TextStyle(
                            color: Colors.white54
                          ),
                          border: InputBorder.none,
                        ) ,
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();

                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0x36ffffff),
                            const Color(0x0fffffff)
                          ]),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(Icons.search)),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  SearchTile({this.userEmail, this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(userName, style: mediumTextStyle(),),
              Text(userEmail, style: mediumTextStyle(),),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Message", style: mediumTextStyle(),),
            ),
          ),
        ],
      ),
    );
  }
}
