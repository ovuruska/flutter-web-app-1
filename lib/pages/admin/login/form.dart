import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/admin/login/controller.dart';

class AdminLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(
            maxWidth: 640, maxHeight: 640, minWidth: 480, minHeight: 480),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Text('Sign In',
                    style: FlutterFlowTheme.of(context).title1)),
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                    onChanged: (value) => adminLoginBloc.setEmail(value),
                    decoration: InputDecoration(labelText: 'Email'))),
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                    obscureText: true,
                    onChanged: (value) =>
                        adminLoginBloc.setPassword(value),
                    decoration: InputDecoration(labelText: 'Password'))),
            Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          adminLoginBloc.signIn();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).secondaryColor),
                          foregroundColor: MaterialStateProperty.all(
                              FlutterFlowTheme.of(context).primaryText),
                        ),
                        child: Text('Submit'))))
          ],
        ));
  }
}
