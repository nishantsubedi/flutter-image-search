import 'package:flutter/material.dart';
import 'package:image_search/routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        title: 'ImageSearch',
        theme: new ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: '/',
        routes: routes,
      );
    }
}