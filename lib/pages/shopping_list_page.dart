import 'package:flutter/material.dart';
import '../widgets/shopping_list.dart';
import '../models/product.dart';

class ShoppingListPage extends StatelessWidget {

  ShoppingListPage({ Key key, this.products }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ShoppingList(products: products,),
    );
  }
}