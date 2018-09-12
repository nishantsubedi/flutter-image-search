import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: new DrawerOnly(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHomeSearchContainer(context),
            ],
          ),
        ),
      ),
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

  Widget _buildHomeSearchContainer(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            //height: MediaQuery.of(context).size.height * 0.475,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              // image: DecorationImage(
              //     image: AssetImage("images/car_background.png"),
              //     fit: BoxFit.cover)),
            )),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(top: 280.0),
                      padding: EdgeInsets.all(10.0),
                      //height: 30.0,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search, size: 18.0, color: Colors.grey),
                          Text(
                            "Tap to Search....",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
