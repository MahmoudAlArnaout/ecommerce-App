class Item {
  final String image;
  final String title;
  final String subTitle;
  final String price;

  Item(
      {required this.image,
        required this.title,
        required this.subTitle,
        required this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      image: map['image'],
      title: map['title'],
      subTitle: map['subTitle'],
      price: map['price'],
    );
  }




}
