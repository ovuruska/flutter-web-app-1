import 'package:scrubbers_employee_application/pages/dashboard/sidebar/tabs/cancelled/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/tabs/pending/controller.dart';
import 'package:scrubbers_employee_application/pages/dashboard/sidebar/tabs/waitlist/controller.dart';

import 'dart:html' as html;

import 'blocs/branches/Controller.dart';
import 'blocs/employees/Controller.dart';
import 'blocs/products/Controller.dart';
import 'pages/dashboard/controller.dart';
import 'pages/dashboard/repository.dart';
import 'pages/dashboard/sidebar/controller.dart';
import 'repositories/branch.dart';
import 'repositories/product.dart';
import 'repositories/service.dart';





Future<void> initFromServer() async {

  List<Future> futures = [
    sidebarCancelledAppointmentsBloc.fetch(),
    sidebarPendingAppointmentsBloc.fetch(),
    sidebarWaitlistBloc.fetch(),
    BranchRepository.instance.fetchAll().then((branches) {
      branchesBloc.setBranches(branches!);
      if (branches.length > 0) {
        sidebarBloc.setBranch(branches[0]);
        dashboardBloc.fetchDailyAppointments(branches[0], DateTime.now());
      }
    }),

    DashboardRepository.instance
        .getPendingAppointments()
        .then((appointments) {
      if (appointments != null)
        sidebarPendingAppointmentsBloc.setAppointments(appointments);

    }),
    DashboardRepository.instance
        .getReschedulingAppointments()
        .then((appointments) {
      if (appointments != null)
        sidebarWaitlistBloc.setAppointments(appointments);
    }),
    DashboardRepository.instance
        .getCancelledAppointments()
        .then((appointments) {
      if (appointments != null)
        sidebarCancelledAppointmentsBloc.setAppointments(appointments);
    }),
    ProductRepository.instance.fetchAll().then((products) {
      productsBloc.setProducts(products!);
    }),
  ];

  // Prevents default behaviour on right click.
  html.document.body!
      .addEventListener('contextmenu', (event) => event.preventDefault());


  await Future.wait(futures);

}
