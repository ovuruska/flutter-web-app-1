part of 'appointment.dart';

extension AppointmentSection on AppointmentEntity {
  AppointmentEntity clone() => AppointmentEntity(
      id: id,
      customer: customer,
      pet: pet,
      start: start,
      end: end,
      status: status,
      branch: branch,
      service: service,
      employee: employee,
      customerNotes: customerNotes,
      employeeNotes: employeeNotes,
      products: products,
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
      'dog': pet.id,
      'start': decodeDateTime(start)!,
      'end': decodeDateTime(end)!,
      'customer_notes': customerNotes,
      'employee_notes': employeeNotes,
      'status': status,
      'branch': branch.id,
      'employee': employee.id,
      'appointment_type': service,
      'products': products.map((e) => e.id).toList(),
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