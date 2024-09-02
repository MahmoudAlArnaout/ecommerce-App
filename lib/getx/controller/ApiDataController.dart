import 'package:get/get.dart';
import 'package:ecommerce/basic_flutter/ApiData.dart';

class ApiController extends GetxController {
  final loading = false.obs;
  final apiData = ApiData().obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() async {
    loading.value = true;
    await apiData.value.setData();
    if (apiData.value.valid == false) {
      Get.snackbar(
        'Error',
        'No internet connection',
        duration: Duration(seconds: 2),
      );
      Get.back();
    }
    loading.value = false;
  }

  List? get data => apiData.value.getData();
}
