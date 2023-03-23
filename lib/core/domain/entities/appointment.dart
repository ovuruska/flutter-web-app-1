import 'package:scrubbers_employee_application/core/domain/entities/employee_entity.dart';

import 'branch_entity.dart';
import 'client_entity.dart';
import 'pet_entity.dart';
import 'product_entity.dart';


part 'appointment.g.dart';


class AppointmentEntity {
  final int id;
  final ClientEntity customer;
  final PetEntity pet;
  DateTime start;
  DateTime end;
  final String customerNotes;
  final String employeeNotes;
  final String status;
  final BranchEntity branch;
  final EmployeeEntity employee;
  final List<ProductEntity> products;
  final String service;
  double tip;
  DateTime? reminderSent;
  DateTime? checkIn;
  DateTime? pickUp;
  DateTime? confirmedOn;
  bool specialHandling;
  bool checkoutStatus;
  EmployeeEntity? checkoutBy;
  DateTime? checkoutTime;
  bool submitted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastDogAppointment;
  final DateTime? lastCustomerAppointment;

  AppointmentEntity({
    required this.id,
    this.products = const [],
    required this.service,
    required this.customer,
    required this.pet,
    required this.start,
    required this.end,
    this.customerNotes = "",
    this.employeeNotes = "",
    required this.status,
    required this.employee,
    required this.branch,
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

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) {

    return AppointmentEntity(
      id: json['id'],
      customer: ClientEntity.fromJson(json['customer']),
      pet: PetEntity.fromJson(json['dog']),
      start: DateTime.parse(json['start']).toLocal(),
      end: DateTime.parse(json['end']).toLocal(),
      customerNotes: json['customer_notes'],
      employeeNotes: json['employee_notes'],
      status: json['status'],
      branch: BranchEntity.fromJson(json['branch']),
      employee: EmployeeEntity.fromJson(json['employee']),
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      products:
          (json['products'] as List).map((e) => ProductEntity.fromJson(e)).toList(),
      service: json['appointment_type'],
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
          ? EmployeeEntity.fromJson(json['checkout_by'])
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
        'dog': pet.toJson(),
        'start': decodeDateTime(start)!,
        'end': decodeDateTime(end)!,
        'customer_notes': customerNotes,
        'employee_notes': employeeNotes,
        'status': status,
        'branch': branch.toJson(),
        'employee': employee.toJson(),
        'products': products.map((e) => e.toJson()).toList(),
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

  AppointmentEntity update({
    ClientEntity? customer,
    PetEntity? pet,
    DateTime? start,
    DateTime? end,
    String? customerNotes,
    String? employeeNotes,
    String? status,
    BranchEntity? branch,
    EmployeeEntity? employee,
    String? appointmentType,
    List<ProductEntity>? products,
    String? service,
    double? tip,
    DateTime? reminderSent,
    DateTime? checkIn,
    DateTime? pickUp,
    DateTime? confirmedOn,
    bool? specialHandling,
    bool? checkoutStatus,
    EmployeeEntity? checkoutBy,
    DateTime? checkoutTime,
  }) =>
      AppointmentEntity(
        createdAt: this.createdAt,
        updatedAt: this.updatedAt,
        id: this.id,
        customer: customer ?? this.customer,
        pet: pet ?? this.pet,
        start: start ?? this.start,
        end: end ?? this.end,
        customerNotes: customerNotes ?? this.customerNotes,
        employeeNotes: employeeNotes ?? this.employeeNotes,
        status: status ?? this.status,
        branch: branch ?? this.branch,
        employee: employee ?? this.employee,
        service: service ?? this.service,
        products: products ?? this.products,
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
