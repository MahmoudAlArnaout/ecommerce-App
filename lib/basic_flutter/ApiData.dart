import 'dart:convert';
import 'package:http/http.dart';

class ApiData {

  List? data;
  bool? valid;

  Future<void> setData() async {
    try{
    if (data == null) {
       var response = await get(
           Uri.parse("https://jsonplaceholder.typicode.com/albums"));
       var dataFromJson = jsonDecode(response.body);
       data = [];
       data!.addAll(dataFromJson);
       valid = true;
    }
    }
    catch(e){
      valid=false;
    }
  }

  List? getData() {
    return data;
  }

}
