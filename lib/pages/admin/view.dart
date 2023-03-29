import 'package:flutter/material.dart';

import '../../injection.dart';
import 'admin_page_context.dart';
import 'register.dart';
import 'screen_factory.dart';

class AdminView extends StatefulWidget {

  @override
  _AdminViewState createState() => _AdminViewState();
}
class _AdminViewState extends State<AdminView> {

  @override
  void initState(){
    super.initState();

    registerAdminPage(sl);

  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: AdminPageContextProvider(
          notifier: AdminPageContext(
          ),
          child: AdminViewScreenFactory(),
        ));
  }
}
