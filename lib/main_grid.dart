// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new GridApp());
}

class GridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
List<Container> _buildGridTileList(int count) {
  List<Container> containers = new List<Container>.generate(
      count,
          (int index) =>
      new Container(child: new Image.asset('images/lake.jpg')));
  return containers;
}

Widget buildGrid() {
//  return new GridView.extent(
//      maxCrossAxisExtent: 200.0,
//      padding: const EdgeInsets.all(10.0),
//      mainAxisSpacing: 10.0,
//      crossAxisSpacing: 10.0,
//      children: _buildGridTileList(30));

  return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20.0),
    crossAxisSpacing: 10.0,
    crossAxisCount: 3,
    children: _buildGridTileList(30),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}