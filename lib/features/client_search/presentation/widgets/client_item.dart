import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_search_entity.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/higlight_text.dart';

import '../../domain/entities/client_dog_entity.dart';

class ClientItem extends StatelessWidget {
  final ClientSearchEntity client;
  final String query;

  const ClientItem({Key? key, required this.client, required this.query})
      : super(key: key);

  String _avatarText(String clientName) {
    var firstLetterOfName = clientName.substring(0, 1).toUpperCase();
    var firstLetterOfLastName = "";
    try {
      firstLetterOfLastName = clientName
          .substring(clientName.indexOf(' ') + 1, clientName.indexOf(' ') + 2)
          .toUpperCase();
    } catch (e) {}
    return firstLetterOfName + firstLetterOfLastName;
  }

  String _dogs(List<ClientDogEntity> dogs) {
    var dogNames = "";
    dogs.forEach((dog) {
      dogNames += dog.name + ", ";
    });
    return dogNames.substring(0, dogNames.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    var avatarText = _avatarText(client.name);
    var dogs = _dogs(client.dogs);

    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: const Color(0xFFD9D9D9),
            width: 0.5,
          ),
        )),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(avatarText),
              ),
              title: HighlightText(text: client.name, query: query),
              subtitle: HighlightText(text: dogs, query: query),
              trailing: Icon(Icons.arrow_forward_ios),
            ))));
  }
}
