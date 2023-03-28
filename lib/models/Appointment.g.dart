part of 'Appointment.dart';

extension AppointmentSection on AppointmentEntity {
  AppointmentEntity clone() => AppointmentEntity(
      id: id,
      customer: customer,
      dog: dog,
      start: start,
      end: end,
      status: status,
      branch: branch,
      appointmentType: appointmentType,
      employee: employee,
      customerNotes: customerNotes,
      employeeNotes: employeeNotes,
      products: products,
      services: services,
      tip: tip,
      reminderSent: reminderSent,
      checkIn: checkIn,
      pickUp: pickUp,
      confirmedOn: confirmedOn,
      specialHandling: specialHandling,
      checkoutStatus: checkoutStatus,
      checkoutBy: checkoutBy,
      checkoutTime: checkoutTime,
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastCustomerAppointment: lastCustomerAppointment,
      lastDogAppointment: lastDogAppointment,
      submitted: submitted);

  String? decodeDateTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return dateTime.toUtc().toIso8601String();
  }

  Map<String,dynamic> shallowJson() {
    return {
      'id': id,
      'customer': customer.id,
      'dog': dog.id,
      'start': decodeDateTime(start)!,
      'end': decodeDateTime(end)!,
      'customer_notes': customerNotes,
      'employee_notes': employeeNotes,
      'status': DataTypes.convertToString(status),
      'branch': branch.id,
      'employee': employee.id,
      'appointment_type': appointmentType,
      'products': products.map((e) => e.id).toList(),
      'services': services.map((e) => e.id).toList(),
      'tip': tip,
      'reminder_sent': decodeDateTime(reminderSent),
      'check_in': decodeDateTime(checkIn),
      'pick_up': decodeDateTime(pickUp),
      'confirmed_on': decodeDateTime(confirmedOn),
      'special_handling': specialHandling,
      "checkout_status": checkoutStatus,
      "checkout_by": checkoutBy?.id,
      "checkout_time": decodeDateTime(checkoutTime),
      "last_dog_appointment": decodeDateTime(lastDogAppointment),
      "last_customer_appointment": decodeDateTime(lastCustomerAppointment),
    };
  }
}