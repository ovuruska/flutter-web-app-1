import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/customers/Controller.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Customer.dart';
import 'package:scrubbers_employee_application/models/Pet.dart';
import 'package:scrubbers_employee_application/pages/pets/Main/DataTable/Controller.dart';

import '../Controller.dart';

class CustomersSidebarListItem extends StatelessWidget {
  final Customer customer;
  bool selected;

  CustomersSidebarListItem({Key? key, required this.customer, this.selected = false})
      : super(key: key);

  Widget _selected(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          color: selected
              ? FlutterFlowTheme.of(context).secondaryColor
              : FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                customer.name,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
  Widget _nonselected(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          color: selected
              ? FlutterFlowTheme.of(context).secondaryColor
              : FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                customer.name,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );

  onClick(){
    var currentIndex = customersBloc.value.customers.indexWhere((element) => element.id == customer.id);
    customersViewBloc.setCurrentIndex(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    if(selected){
      return _selected(context);
    }else{
      return _nonselected(context);
    }
  }
}
