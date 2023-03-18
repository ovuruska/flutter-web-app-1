import '../entities/client_search_entity.dart';

abstract class SelectClientCallback {
  void call(ClientSearchEntity client);
}
