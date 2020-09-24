import 'package:Nift/reusable_card.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  // HomePage({this.uid});
  // final String uid;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String threadMessage;
  String subtitleMessage;

  TextEditingController titleInputController;
  TextEditingController subtitleInputController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/nifte.jpg',
            fit: BoxFit.contain,
            height: 60,
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                    size: 26.0,
                  ),
                )),
          ],
        ),
      ),
      //card
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ThreadStream(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 15.0,
        onPressed: () {
          _showDialog();
        },
        tooltip: 'Add',
        label: Text(
          'Post Thread',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black38,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          children: <Widget>[
            Text("Please fill all fields to create a new thread"),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  threadMessage = value;
                },
                autofocus: true,
                decoration: InputDecoration(labelText: 'Title*'),
                controller: titleInputController,
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  subtitleMessage = value;
                },
                decoration: InputDecoration(labelText: 'Thread*'),
                controller: subtitleInputController,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                if (threadMessage.isEmpty && subtitleMessage.isEmpty) {
                  titleInputController.clear();
                  subtitleInputController.clear();
                  Navigator.pop(context);
                }
              }),
          FlatButton(
              child: Text('Add'),
              onPressed: () {
                if
                    //(subtitleInputController.text.isNotEmpty && titleInputController.text.isNotEmpty)
                    (subtitleMessage.isNotEmpty && threadMessage.isNotEmpty) {
                  FirebaseFirestore.instance
                      //   .collection("users")
                      // .document(widget.uid)
                      .collection('thread')
                      .add({
                        "title": threadMessage,
                        "subtitle": subtitleMessage,
                      })
                      .then((result) => {
                            Navigator.pop(context),
                            titleInputController.clear(),
                            subtitleInputController.clear(),
                          })
                      .catchError((err) => print(err));
                }
              })
        ],
      ),
    );
  }
}
