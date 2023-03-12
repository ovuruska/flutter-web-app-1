

import 'package:flutter/material.dart';

class ScheduleNavbar extends StatelessWidget {
  // Generate a icon button with a tooltip
  // Icon button should have full screen icon over it.
  final bool isFullScreen;
  final Function()? onPressed;

  const ScheduleNavbar({Key? key, required this.isFullScreen, this.onPressed}) : super(key: key);

  Widget _generateFullScreen() {
    return IconButton(
      icon: Icon(Icons.fullscreen),
      tooltip: 'Expand daily calendar to full screen',
      onPressed: onPressed,
    );
  }

  Widget _generateExitFullScreen() {
    return IconButton(
      icon: Icon(Icons.fullscreen_exit),
      tooltip: 'Exit full screen',
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 16,
        ),
        isFullScreen ? _generateExitFullScreen() : _generateFullScreen(),
      ],
    );
  }
}