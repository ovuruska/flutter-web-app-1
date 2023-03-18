
import '../entities/client_pet_item.dart';

abstract class SelectPetCallback {
  void call(ClientPetItem pet);
}