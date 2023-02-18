import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/blocs/branches/Controller.dart';
import 'package:scrubbers_employee_application/common/StreamListenableBuilder.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Branches/Controller.dart';
import 'package:scrubbers_employee_application/repositories/branch.dart';

import 'Controller.dart';

class AdminBranchesTabInformationRowButtonGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamListenableBuilder(
      stream: adminBranchesTabBloc.stream,
      listener: (value) {},
      builder: (context, _) => _build(context));

  Widget _button(Widget child) {
    return SizedBox(width: 160, height: 48, child: child);
  }

  Widget _build(BuildContext context) {
    var editable = adminBranchesTabBloc.value.editable;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _button(
            ElevatedButton(
              child: Text("Create branch"),
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              onPressed: () {
                BranchRepository.instance.init().then((branch) {
                  branchesBloc.addBranch(branch);
                  var totalBranches = branchesBloc.value.branches.length;
                  adminBranchesTabBloc.setCurrentIndex(totalBranches - 1);
                  adminBranchesTabBloc.setEditable();
                });
              },
            ),
          ),
          (editable)
              ? _button(
                  ElevatedButton(
                    child: Text("Save branch"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    onPressed: (adminBranchesTabBloc.getCurrentBranch() == null)
                        ? null
                        : () {
                            var currentIndex =
                                adminBranchesTabBloc.value.currentIndex;
                            adminBranchesTabBloc.clearEditable();
                            var branch =
                                branchesBloc.value.branches[currentIndex];
                            var phone =
                                adminBranchesTabInformationRowBloc.value.phone;
                            var address = adminBranchesTabInformationRowBloc
                                .value.address;
                            var name =
                                adminBranchesTabInformationRowBloc.value.name;
                            var description = adminBranchesTabInformationRowBloc
                                .value.description;
                           var newBranch =  branchesBloc.updateBranch(
                              currentIndex,
                              name: name ,
                              address: address ,
                              phone: phone ,
                              description: description ,
                            );
                           BranchRepository.instance.modify(newBranch);
                          },
                  ),
                )
              : _button(
                  ElevatedButton(
                    child: Text("Edit branch"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    onPressed: (adminBranchesTabBloc.getCurrentBranch() == null)
                        ? null
                        : () {
                      adminBranchesTabBloc.setEditable();
                    },
                  ),
                ),
          _button(ElevatedButton(
            child: Text("Delete branch"),
            style: ElevatedButton.styleFrom(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onPressed: (adminBranchesTabBloc.getCurrentBranch() == null)
                ? null
                : () {

                    var currentIndex = adminBranchesTabBloc.value.currentIndex;
                    var branchId = branchesBloc.value.branches[currentIndex].id;
                    BranchRepository.instance.remove(branchId).then((value) {
                      branchesBloc.removeBranch(currentIndex);
                      adminBranchesTabBloc.prevIndex();
                    });

                  },
          ))
        ],
      ),
    );
  }
}
