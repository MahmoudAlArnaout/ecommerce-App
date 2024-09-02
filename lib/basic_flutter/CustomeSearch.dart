
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  var data;

  CustomSearch({this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = '';
      }, icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.of(context).pop();
    },
      icon: const Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("hi");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List? filtered;
    if (query == "") {
      return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text("${data![i]['title']}"),
            ),
          );
        },
      );
    }
    else {
      List titles = data.map((map) => map['title']).toList();
      filtered = titles.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text("$filtered",
                style: const TextStyle(fontSize: 16),),
            ),
          );
        },
      );
    }
  }
}