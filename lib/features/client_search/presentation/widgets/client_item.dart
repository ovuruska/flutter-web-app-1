import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/features/client_search/domain/entities/client_search_entity.dart';
import 'package:scrubbers_employee_application/features/client_search/presentation/widgets/higlight_text.dart';

import '../../domain/callbacks/select_client_callback.dart';
import '../../domain/entities/client_dog_entity.dart';

class ClientItem extends StatelessWidget {
  final ClientSearchEntity client;
  final String query;
  final bool selected;
  final SelectClientCallback? onSelect;

  const ClientItem(
      {Key? key,
      required this.client,
      required this.query,
      this.selected = false,
      this.onSelect})
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
    // 23-02-2021
    var formatter = new DateFormat('dd-MM-yyyy');

    return GestureDetector(
        onTap: () {
          if (onSelect != null) {
            onSelect!(client);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: const Color(0xFFD9D9D9),
                width: 0.5,
              ),
            )),
            child: ListTile(
              mouseCursor: SystemMouseCursors.click,
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(avatarText),
              ),
              title: HighlightText(text: client.name, query: query),
              subtitle: HighlightText(text: dogs, query: query),

            )));
  }
}
