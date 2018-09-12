import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatelessWidget {
  TextEditingController _searchTextController = new TextEditingController();  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _searchTextController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Search Images',
                  hintStyle: TextStyle(color: Colors.white),),
                  cursorColor: Colors.purple,
              keyboardType: TextInputType.text,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  print(_searchTextController.text);
                },
              )
            ],
          ),
          body: Text('Results')),
      onWillPop: () {
        _neverSatisfied(context);
      },
    );
  }

  Future<Null> _neverSatisfied(BuildContext context) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure to exit the application?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Yes'),
              onPressed: () {
                exit(0);
              },
            ),
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
