// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'pages/shopping_list_page.dart';
import 'models/product.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;

  final products = const [Product(name: 'Eggs'), Product(name: 'Flour'), Product(name: 'Chocolate')];
  runApp(MaterialApp(
    title: 'Shopping App',
    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.pinkAccent,
    ),
    home: ShoppingListPage(products: products),
  ));
}