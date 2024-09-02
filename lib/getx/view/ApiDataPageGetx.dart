import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../basic_flutter/CustomeSearch.dart';
import '../controller/ApiDataController.dart';


class ApiDataPageGetx extends StatelessWidget {
  const ApiDataPageGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
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
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearch(data: apiController.data),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(() {
        if (apiController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: apiController.data?.length ?? 0,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text("${apiController.data![i]['title']}"),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
