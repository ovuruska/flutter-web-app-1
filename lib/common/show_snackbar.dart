import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool _isSnackbarActive = false;
final duration = Duration(seconds: 2);

void _handleSnackbar(
BuildContext context,
SnackBar snackbar,
    void Function() commit,
) {
  if(_isSnackbarActive) return;
  _isSnackbarActive = true;
  ScaffoldMessenger.of(context)
    ..showSnackBar(snackbar).closed.then((reason) {
      _isSnackbarActive = false;
      if (reason != SnackBarClosedReason.action) {
        commit();
      }
    });
}


void showUndoSnackbar({
  required BuildContext context,
  required void Function() undo,
  required void Function() commit,
  String content = ''
}  ) {

  final snackBar = SnackBar(
    content: Text(content,style:GoogleFonts.poppins()),
    duration: duration,
    backgroundColor: const Color(0xFFB1C97F),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.white,
      onPressed: undo,
    ),
  );
  _handleSnackbar(context, snackBar, commit);

}

void showUndoAlertSnackbar({
  required BuildContext context,
  required void Function() undo,
  required void Function() commit,
  String content = ''
}  ) {


  final snackBar = SnackBar(
    content: Text(content,style:GoogleFonts.poppins()),
    duration: duration,
    backgroundColor: const Color(0xFFFF5B5B),
    action: SnackBarAction(
      label: 'Undo',
      textColor: Colors.white,
      onPressed: undo ,
    ),
  );

  _handleSnackbar(context, snackBar, commit);

}