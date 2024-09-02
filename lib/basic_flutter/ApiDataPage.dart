import 'package:ecommerce/basic_flutter/ApiData.dart';
import 'package:flutter/material.dart';

import 'CustomeSearch.dart';

class Apidatapage extends StatefulWidget {
  const Apidatapage({super.key});

  @override
  State<Apidatapage> createState() => _ApidatapageState();
}

class _ApidatapageState extends State<Apidatapage> {
  bool loading = false;
  ApiData apiData = ApiData();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    loading = true;
    setState(() {});
    await apiData.setData();
    if (apiData.valid == false){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds:2),
          content: Text("no internet connection"))
      );
    Navigator.of(context).pop();
    }
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.api,
                color: Colors.black,
              ),
              Text(
                "Api Data",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: CustomSearch(data: apiData.getData()));
            },
                icon: const Icon(Icons.search))
          ],
        ),
        body: loading ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: apiData.getData()!.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text("${apiData.getData()![i]['title']}"),
                      subtitle: Text("${apiData.getData()![i]['title']}"),
                    ),
                  );
                }));
  }
}








