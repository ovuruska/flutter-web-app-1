import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrubbers_employee_application/common/shadow.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_util.dart';
import 'package:scrubbers_employee_application/initWithData.dart';
import 'package:scrubbers_employee_application/pages/login/repository.dart';

const primaryColor = const Color(0xFF78D9FB);
const secondaryColor = const Color(0xFF74C284);

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onLogin(BuildContext context) async {
    var username = usernameController.text;
    var password = passwordController.text;
    final result = await LoginViewRepository.instance.login(username, password);
    if (result) {
      await initFromServer();
      context.pushNamed('Dashboard');
    } else
      print('Login failed');
  }

  @override
  Widget build(BuildContext context) {
    var fontFamily = GoogleFonts.comfortaa().fontFamily;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    secondaryColor,
                    primaryColor,
                  ],
                )),
            child: Center(
              child: SizedBox(
                width: 480,
                child: ShadowContainer(
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: AutofillGroup(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48,
                          child: SvgPicture.asset(
                            'assets/images/quicker.svg',
                            height: 96,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 48),
                        SizedBox(
                          height: 72,
                          child: TextFormField(
                            autofillHints: const <String>[
                              AutofillHints.username
                            ],
                            controller: usernameController,
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                                color: Colors.black, fontFamily: fontFamily),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Colors.black, fontFamily: fontFamily),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 48),
                        SizedBox(
                          height: 72,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            autofillHints: const <String>[
                              AutofillHints.password
                            ],
                            style: TextStyle(
                                color: Colors.black, fontFamily: fontFamily),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.black, fontFamily: fontFamily),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 96),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              onLogin(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text('Submit',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily:
                                      GoogleFonts.comfortaa().fontFamily,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )
                      ],
                    ))),
              ),
            )));
  }
}
