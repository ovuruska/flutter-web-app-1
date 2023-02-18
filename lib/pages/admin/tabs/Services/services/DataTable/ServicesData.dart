import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/models/Service.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/Create/Controller.dart';
import 'package:scrubbers_employee_application/pages/admin/tabs/Services/services/DataTable/Controller.dart';


class ServicesData extends DataTableSource {
  // Generate some made-up services



  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => servicesDataTableBloc.value.services.length;
  @override
  int get selectedRowCount => 0;
  @override

  String getDate(DateTime date){
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  DataCell getCell(String text){
    return DataCell(
        Text(text)
    );
  }

  DataCell getRemoveButton(ServiceModel service){
    return DataCell(
        IconButton(
            icon: Icon(Icons.delete),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
            onPressed: () {
              servicesDataTableBloc.removeService(service);
            }
        )
    );
  }

  DataCell getEditButton(ServiceModel service){
    return DataCell(
        IconButton(
            icon: Icon(Icons.edit),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
            ),
            onPressed: () {
              servicesCreateBloc.setDescription(service.description);
              servicesCreateBloc.setName(service.name);
              servicesCreateBloc.setCost(service.cost.toString());
              servicesCreateBloc.setDuration(service.duration.inMinutes.toString());
              servicesCreateBloc.setId(service.id!);
              servicesCreateBloc.setEditMode();
            }
        )
    );
  }

  DataRow getRow(int index) {
    var idString;
    var service = servicesDataTableBloc.value.services[index];
    if (service.id == null){
      idString = "N/A";
    }else{
      idString = service.id.toString();
    }
    return DataRow(cells: [
      getCell(idString),
      getCell(service.name),
      getCell(service.duration.inMinutes.toString()),
      getCell(service.cost.toString()),
      getRemoveButton(service),
      getEditButton(service)

    ]);
  }
}