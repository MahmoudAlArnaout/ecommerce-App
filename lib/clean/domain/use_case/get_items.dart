import '../repositories/items_repositorie.dart';

class GetItems {
  final ItemsRepositorie repository;

  GetItems({required this.repository});

  Future<List> call() {
    return repository.getItems();
  }
}
