import 'package:flutter/material.dart';
import '../models/product.dart';
import 'shopping_list_item.dart';

class ShoppingList extends StatefulWidget {

  ShoppingList({ Key key, this.products }) : super(key: key);

  final List<Product> products;

  @override
  ShoppingListState createState() => ShoppingListState();
}

class ShoppingListState extends State<ShoppingList> {

  Set<Product> shoppingCart = Set<Product>();

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: configureShoppingListItem(widget.products),
    );
  }

  List<ShoppingListItem> configureShoppingListItem(List<Product> products) {

    return products.map((Product product) {

      return ShoppingListItem(
        product: product,
        inCart: shoppingCart.contains(product),
        onCartChanged: handleCartChanged,
      );
    }).toList();
  }

  void handleCartChanged(Product product) {

    setState(() {

      bool isInCart = shoppingCart.contains(product);

      if (isInCart) {
        shoppingCart.remove(product);
      } else {
        shoppingCart.add(product);
      }
    });
  }
}