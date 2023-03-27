import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../bloc/view_logs_bloc.dart';
import '../bloc/view_logs_event.dart';
import '../bloc/view_logs_state.dart';
import '../widgets/log_tabs.dart';

class ViewLogs extends StatefulWidget {
  final int id;
  const ViewLogs({Key? key, required this.id}) : super(key: key);

  @override
  _ViewLogsState createState() => _ViewLogsState();
}

class _ViewLogsState extends State<ViewLogs> {
  @override
  initState() {
    super.initState();
    sl<ViewLogsBloc>().add(GetLogsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sl<ViewLogsBloc>(),
        builder: (context, state) {
      if (state is Loaded) {
        var logs = state.logs;
        if (logs.isEmpty) {
          return Center(child: Text('No logs found.'));
        }
        return LogTabs(logs: logs);
      } else if (state is Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is Empty) {
        return Center(child: Text('No logs found.'));
      } else {
        return Center(child: Text('Something went wrong.'));
      }
    });
  }
}
