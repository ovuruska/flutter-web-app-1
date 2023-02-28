
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/view_logs/presentation/pages/view_logs.dart';

class ViewLogsDialog extends StatelessWidget {
  final int id;

  const ViewLogsDialog({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: Dialog(
      child:ViewLogs(id: id)
    ));
  }
}
