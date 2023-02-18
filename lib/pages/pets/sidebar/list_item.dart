import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/models/Pet.dart';
import 'package:scrubbers_employee_application/pages/pets/Main/DataTable/Controller.dart';

import '../controller.dart';

class PetsSidebarListItem extends StatelessWidget {
  final PetModel pet;
  bool selected;

  PetsSidebarListItem({Key? key, required this.pet, this.selected = false})
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
                pet.name,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.breed,
                        style: FlutterFlowTheme.of(context).subtitle2.merge(
                          TextStyle(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ),
                      Text(
                        pet.owner.name,
                        style:TextStyle(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      )
                    ],
                  ))
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
                pet.name,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.breed,
                        style: FlutterFlowTheme.of(context).subtitle2.merge(
                          TextStyle(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                        ),
                      ),
                      Text(
                        pet.owner.name,
                        style: FlutterFlowTheme.of(context).subtitle3,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    ),
  );

  onClick(){
    petsBloc.setSelectedPet(pet);
    petsMainDataTableBloc.update();
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
