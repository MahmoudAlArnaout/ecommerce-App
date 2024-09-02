import 'package:flutter/material.dart';

import 'DetailsPage.dart';

class LapTop extends StatefulWidget {
  const LapTop({super.key});

  @override
  State<LapTop> createState() => _LabtopState();
}

class _LabtopState extends State<LapTop> {
  ScrollController? scrollController;

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
    },
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/111.jpg",
      "title": "apple watch",
      "subTitle": "decription",
      "price": "\$350"
    },
  ];
  List items2 = [
    {
      "image": "images/hp.jpeg",
      "title": "hp",
      "subTitle": "dec",
      "price": "\$350"
    },
    {
      "image": "images/222.webp",
      "title": "mac book",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/thinkpad1.jpg",
      "title": "ThinkPad",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
    {
      "image": "images/Dell.jpg",
      "title": "Dell",
      "subTitle": "decription",
      "price": "\$350"
    },
  ];

  @override
  void initState() {
    scrollController != ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "laptop",
                style: TextStyle(fontSize: 25, fontFamily: "GaMaamli"),
              ),
            ],
          ),
        ),
        body: PageView(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250),
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => (DetailsPage(
                                data: items[i],
                              ))));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Image.asset(items[i]["image"]),
                          ),
                          Text(
                            items[i]['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            items[i]['subTitle'],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            items[i]['price'],
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            GridView.builder(
                controller: scrollController,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250),
                itemCount: items2.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => (DetailsPage(
                                data: items2[i],
                              ))));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey,
                            child: Image.asset(items2[i]["image"]),
                          ),
                          Text(
                            items2[i]['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            items2[i]['subTitle'],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            items2[i]['price'],
                            style: const TextStyle(
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
