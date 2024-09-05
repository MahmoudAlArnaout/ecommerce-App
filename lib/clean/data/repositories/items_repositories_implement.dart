import 'package:ecommerce/clean/data/data_sources/item_local_data_source.dart';
import 'package:ecommerce/clean/domain/repositories/items_repositorie.dart';

class ItemRepositoriesImplement extends ItemsRepositorie {

  ItemRepositoriesImplement();

  @override
  Future<List> getItems() async{
   return await ItemLocalDataSource().getItems();
  }


}
