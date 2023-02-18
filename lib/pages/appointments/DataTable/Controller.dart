import 'package:scrubbers_employee_application/common/Bloc.dart';
import 'package:scrubbers_employee_application/common/DataTypes.dart';
import 'package:scrubbers_employee_application/pages/appointments/DataTable/Model.dart';
import 'package:scrubbers_employee_application/pages/appointments/Search/Controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentsDataTableBloc extends Bloc<AppointmentsDataTableModel>{
  AppointmentsDataTableBloc() {
    subject.sink.add(AppointmentsDataTableModel());
  }

  filterData(){
    var searchModel = appointmentSearchBloc.subject.value;

    var filteredAppointments = sidebarBloc.value.calendarAppointments.where((appointment) {
      var isDate = true;
      var isBranch = true;
      var isServiceType = true;
      var isEmployee = true;
      var isStatus = true;
      var isSearch = true;

      if(searchModel.appointmentDate != null){

        isDate = isSameDay(appointment.start, searchModel.appointmentDate);
      }

      if(searchModel.branch != null){
        isBranch = appointment.branch.name == searchModel.branch;
      }

      if(searchModel.serviceType != null){
        isServiceType = appointment.appointmentType == searchModel.serviceType;
      }

      if(searchModel.employee != null){
        isEmployee = appointment.employee.name == searchModel.employee;
      }

      if(searchModel.status != null){
        isStatus = DataTypes.convertToString(appointment.status) == searchModel.status;
      }

      if(searchModel.customerName != ""){
        isSearch = appointment.customer.name.toLowerCase().contains(searchModel.customerName.toLowerCase());
      }

      var result = isDate && isBranch && isServiceType && isEmployee && isStatus && isSearch;
      return result;
    }).toList();
    subject.sink.add(subject.value.setData(filteredAppointments));

  }




}

final appointmentsDataTableBloc = AppointmentsDataTableBloc();