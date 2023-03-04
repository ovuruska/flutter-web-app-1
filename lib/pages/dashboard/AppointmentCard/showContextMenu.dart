import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/repositories/appointment.dart';

showContextMenu(BuildContext context, TapDownDetails details,
    {required Function() onTapApprove, required Function() onTapCancel}) async {
  final RenderBox referenceBox = context.findRenderObject() as RenderBox;
  var _tapPosition = details.globalPosition;
  final RenderObject? overlay = Overlay.of(context).context.findRenderObject();

  final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: [
        PopupMenuItem(
          onTap: onTapApprove,
          child: Text('Approve',
              style: TextStyle(fontFamily: "Inter", color: Colors.green)),
        ),
        PopupMenuItem(
          onTap: onTapCancel,
          child: Text('Decline',
              style: TextStyle(fontFamily: "Inter", color: Colors.red)),
        ),
      ]);
}
