import 'package:flutter/material.dart';

showContextMenu(BuildContext context, TapDownDetails details,
    {required Function() onTapApprove, required Function() onTapCancel}) async {
  var _tapPosition = details.globalPosition;
  final RenderObject? overlay = Overlay.of(context).context.findRenderObject();

  await showMenu(
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