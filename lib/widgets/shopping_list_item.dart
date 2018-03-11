import 'package:flutter/material.dart';
import '../models/product.dart';

typedef void CartChangedCallBack(Product product);

class ShoppingListItem extends StatelessWidget {

  ShoppingListItem({ Product product, this.inCart, this.onCartChanged })
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  Color getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).accentColor;
  }

  TextStyle getTextStyle(BuildContext context) {

    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product);
      },
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: getTextStyle(context)),
    );
  }
}