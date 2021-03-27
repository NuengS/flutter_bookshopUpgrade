import 'package:flutter/material.dart';
import '../components/add_bookitem_buttomsheet.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class BookItem extends StatelessWidget {
  final int bookId;
  final String title;
  final String thumbnailUrl;
  final int price;

  BookItem(
    this.bookId,
    this.title,
    this.thumbnailUrl,
    this.price,
  );

  Widget buildButtonSheet(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    int _qty;
    bool _isUpdate;

    if (cart.items.containsKey(bookId)) {
      _isUpdate = true;
      _qty = cart.items[bookId].qty;
    } else {
      _isUpdate = false;
      _qty = 1;
    }
    return AddBookItemButtomSheet(
        bookId, title, price, thumbnailUrl, _qty, _isUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) =>
          //         BookDetail(bookId, title, thumbnailUrl, price)));
          Navigator.of(context).pushNamed('/book-detail', arguments: {
            "bookId": bookId,
            "title": title,
            "thumbnailUrl": thumbnailUrl,
            "price": price,
          });
        },
        child: GridTile(
          child: Image.network(thumbnailUrl, fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                //cart.addItem(bookId, title, price);
                showModalBottomSheet(
                    context: context, builder: buildButtonSheet);
              },
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
