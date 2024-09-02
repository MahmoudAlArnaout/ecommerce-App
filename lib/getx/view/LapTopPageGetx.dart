import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../basic_flutter/DetailsPage.dart';
import '../controller/LapTopController.dart';

class LapTopPageGetx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LapTopController controller = Get.put(LapTopController());

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Laptop",
              style: TextStyle(fontSize: 25, fontFamily: "GaMaamli"),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return PageView(
          children: [
            _buildGridView(controller.items),
            _buildGridView(controller.items1),
          ],
        );
      }),
    );
  }

  Widget _buildGridView(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
      ),
      itemCount: items.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                data: items[i],
              ),
            ));
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
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  items[i]['price'],
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
