import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart' show Cart;
import '../providers/order_provider.dart';

import '../components/book_list/badge.dart';

class MyOrdersScreen extends StatelessWidget {
  static const routeName = '/myorders';

  @override
  Widget build(BuildContext context) {
    Order orderList = Provider.of<Order>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: orderList.orders.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: ListTile(
                      leading: FittedBox(
                        child: Image(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuFiYHI3c6KBLssRJ-FHLxawupVuRJg4DSag&usqp=CAU'),
                        ),
                      ),
                      title: Text('${(orderList.orders.toList()[i]).name}'),
                      subtitle: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            child: Text(
                              '${(orderList.orders.toList()[i]).address}\n${(orderList.orders.toList()[i]).total}',
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          //Code here
        ],
      ),
    );
  }
}
