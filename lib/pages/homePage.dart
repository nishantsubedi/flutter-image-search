import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_search/services/searchService.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController _searchTextController = new TextEditingController();
  bool _initiaLandingPage = true;
  String _query = 'moon';
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
              hintStyle: TextStyle(color: Colors.white),
            ),
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
                setState(() {
                  _initiaLandingPage = false;
                  _query = _searchTextController.text;
                });
              },
            )
          ],
        ),
        body: _displayResults(),
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

  Widget _displayResults() {
    if (_initiaLandingPage) {
      return Text('Home');
    } else {
      print('here');

      return FutureBuilder(
        future: SearchService.get().searchImage(_query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Swiper(
              itemCount: 15,
              scrollDirection: Axis.horizontal,

              itemBuilder: (BuildContext context, int index) {
                return CachedNetworkImage(
                    imageUrl: snapshot.data[index].url,
                    width: MediaQuery.of(context).size.width,
                    // height: 70.0,
                    placeholder: Image.asset(
                      "images/images.png",
                      width: MediaQuery.of(context).size.width,
                      // height: 70.0,
                    ));
                // return new Image.network(
                //   snapshot.data[index].url,
                //   // "http://via.placeholder.com/350x150",
                //   // fit: BoxFit.fill,
                //   width:100.0,
                //   height: 70.0,
                // );
              },
              // itemCount: snapshot.data.,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }
  }
}
