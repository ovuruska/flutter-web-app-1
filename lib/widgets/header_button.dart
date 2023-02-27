import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_widgets.dart';

class HeaderButton extends StatelessWidget {
  final String text;
  final String route;

  const HeaderButton({Key? key, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentRoute = GoRouter.of(context).location;
    var isCurrentRoute =
        currentRoute.toLowerCase().contains(route.toLowerCase());
    return Expanded(


      child:Container(
        height:40,
        decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
    ),
      child:FFButtonWidget(
        onPressed: () {
          if(currentRoute != route) context.pushNamed(route);
        },
        text: text,
        options: FFButtonOptions(
          color: isCurrentRoute
              ? FlutterFlowTheme.of(context).secondaryColor
              : FlutterFlowTheme.of(context).primaryColor,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Inter',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    ));
  }
}
