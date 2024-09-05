import 'package:ecommerce/clean/data/models/item_model.dart';

class ItemLocalDataSource {
  List items = [
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/222.webp",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    }
  ];

  Future<List> getItems() async {
    await  Future.delayed(Duration(seconds: 1));
    items.map((item) => Item.fromMap(item)).toList();
    return items;
  }
}
