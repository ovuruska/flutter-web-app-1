import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen.dart';

class LoginButton extends StatelessWidget {
  final Function() onPressed;
  final bool loading;

  const LoginButton({Key? key, required this.loading, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: (loading)
              ? Text('Submit',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.comfortaa().fontFamily,
                    fontWeight: FontWeight.bold,
                  ))
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )),
    );
  }
}
