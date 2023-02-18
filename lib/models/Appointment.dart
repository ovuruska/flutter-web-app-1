import 'package:intl/intl.dart';

import '../common/DataTypes.dart';
import 'Branch.dart';
import 'Customer.dart';
import 'Employee.dart';
import 'Pet.dart';
import 'Product.dart';
import 'Service.dart';
part 'Appointment.g.dart';

enum AppointmentStatus {
  PENDING,
  CONFIRMED,
  CANCELLED,
  COMPLETED,
  RESCHEDULING,
  CHECKED_IN,
  PICKUP_READY,
  CLOSED_CHARGED,
  NO_SHOW,
}

class Appointment {
  final String id;
  final Customer customer;
  final PetModel dog;
  DateTime start;
  DateTime end;
  final String customerNotes;
  final String employeeNotes;
  AppointmentStatus status;
  final Branch branch;
  final Employee employee;
  final String appointmentType;
  final List<Product> products;
  final List<ServiceModel> services;
  double tip;
  DateTime? reminderSent;
  DateTime? checkIn;
  DateTime? pickUp;
  DateTime? confirmedOn;
  bool specialHandling;
  bool checkoutStatus;
  Employee? checkoutBy;
  DateTime? checkoutTime;
  bool submitted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastDogAppointment;
  final DateTime? lastCustomerAppointment;

  Appointment({
    required this.id,
    this.products = const [],
    this.services = const [],
    required this.customer,
    required this.dog,
    required this.start,
    required this.end,
    this.customerNotes = "",
    this.employeeNotes = "",
    required this.status,
    required this.employee,
    required this.branch,
    required this.appointmentType,
    this.tip = 0,
    this.reminderSent,
    this.checkIn,
    this.pickUp,
    this.confirmedOn,
    this.specialHandling = false,
    this.checkoutBy,
    this.checkoutTime,
    this.checkoutStatus = false,
    this.submitted = false,
    required this.createdAt,
    required this.updatedAt,
    required this.lastCustomerAppointment,
    required this.lastDogAppointment,
  });

  get modifiable => !this.submitted;

  factory Appointment.fromJson(Map<String, dynamic> json) {
    var employee = (json["employee"] == null)
        ? Employee.empty()
        : Employee.fromJson(json["employee"]);
    return Appointment(
      id: json['id'].toString(),
      customer: Customer.fromJson(json['customer']),
      dog: PetModel.fromJson(json['dog']),
      start: DateTime.parse(json['start']).toLocal(),
      end: DateTime.parse(json['end']).toLocal(),
      customerNotes: json['customer_notes'],
      employeeNotes: json['employee_notes'],
      status: DataTypes.convertFromString(json['status'] ?? ""),
      branch: Branch.fromJson(json['branch']),
      employee: employee,
      appointmentType: json['appointment_type'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      products:
          (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
      services: (json['services'] as List)
          .map<ServiceModel>((e) => ServiceModel.fromJson(e))
          .toList(),
      tip: double.parse(json['tip']),
      reminderSent: json['reminder_sent'] != null
          ? DateTime.parse(json['reminder_sent'])
          : null,
      checkIn: json['check_in'] != null
          ? DateTime.parse(json['check_in']).toLocal()
          : null,
      pickUp: json['pick_up'] != null
          ? DateTime.parse(json['pick_up']).toLocal()
          : null,
      confirmedOn: json['confirmed_on'] != null
          ? DateTime.parse(json['confirmed_on']).toLocal()
          : null,
      specialHandling: json['special_handling'] ?? false,
      checkoutBy: json['checkout_by'] != null
          ? Employee.fromJson(json['checkout_by'])
          : null,
      checkoutStatus: json['checkout_status'] ?? false,
      checkoutTime: json['checkout_time'] != null
          ? DateTime.parse(json['checkout_time']).toLocal()
          : null,
      lastDogAppointment: json['last_dog_appointment'] != null
          ? DateTime.parse(json['last_dog_appointment']).toLocal()
          : null,
      lastCustomerAppointment: json['last_customer_appointment'] != null
          ? DateTime.parse(json['last_customer_appointment']).toLocal()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer': customer.toJson(),
        'dog': dog.toJson(),
        'start': decodeDateTime(start)!,
        'end': decodeDateTime(end)!,
        'customer_notes': customerNotes,
        'employee_notes': employeeNotes,
        'status': status.index,
        'branch': branch.toJson(),
        'employee': employee.toJson(),
        'appointment_type': appointmentType,
        'products': products.map((e) => e.toJson()).toList(),
        'services': services.map((e) => e.toJson()).toList(),
        'tip': tip,
        'reminder_sent': decodeDateTime(reminderSent),
        'check_in': decodeDateTime(checkIn),
        'pick_up': decodeDateTime(pickUp),
        'confirmed_on': decodeDateTime(confirmedOn),
        'special_handling': specialHandling,
        "checkout_status": checkoutStatus,
        "checkout_by": checkoutBy?.toJson(),
        "checkout_time": decodeDateTime(checkoutTime),
        "last_dog_appointment": decodeDateTime(lastDogAppointment),
        "last_customer_appointment": decodeDateTime(lastCustomerAppointment),
      };

  Appointment update({
    Customer? customer,
    PetModel? dog,
    DateTime? start,
    DateTime? end,
    String? customerNotes,
    String? employeeNotes,
    AppointmentStatus? status,
    Branch? branch,
    Employee? employee,
    String? appointmentType,
    List<Product>? products,
    List<ServiceModel>? services,
    double? tip,
    DateTime? reminderSent,
    DateTime? checkIn,
    DateTime? pickUp,
    DateTime? confirmedOn,
    bool? specialHandling,
    bool? checkoutStatus,
    Employee? checkoutBy,
    DateTime? checkoutTime,
  }) =>
      Appointment(
        createdAt: this.createdAt,
        updatedAt: this.updatedAt,
        id: this.id,
        customer: customer ?? this.customer,
        dog: dog ?? this.dog,
        start: start ?? this.start,
        end: end ?? this.end,
        customerNotes: customerNotes ?? this.customerNotes,
        employeeNotes: employeeNotes ?? this.employeeNotes,
        status: status ?? this.status,
        branch: branch ?? this.branch,
        employee: employee ?? this.employee,
        appointmentType: appointmentType ?? this.appointmentType,
        products: products ?? this.products,
        services: services ?? this.services,
        tip: tip ?? this.tip,
        reminderSent: reminderSent ?? this.reminderSent,
        checkIn: checkIn ?? this.checkIn,
        pickUp: pickUp ?? this.pickUp,
        confirmedOn: confirmedOn ?? this.confirmedOn,
        specialHandling: specialHandling ?? this.specialHandling,
        checkoutStatus: checkoutStatus ?? this.checkoutStatus,
        checkoutBy: checkoutBy ?? this.checkoutBy,
        checkoutTime: checkoutTime ?? this.checkoutTime,
        lastCustomerAppointment: this.lastCustomerAppointment,
        lastDogAppointment: this.lastDogAppointment,
      );


}
