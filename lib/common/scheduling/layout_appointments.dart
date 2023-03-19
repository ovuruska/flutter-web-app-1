
import 'models/scheduling_appointment_layout.dart';
import 'models/scheduling_appointment_entity.dart';



bool isEqual(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day &&
      a.hour == b.hour && a.minute == b.minute;
}


List<SchedulingAppointmentLayout> layoutAppointments(
    List<SchedulingAppointmentEntity> appointments) {
  List<List<SchedulingAppointmentLayout>> columns = [];
  List<SchedulingAppointmentLayout> cleared = [];
  DateTime? lastEventEnding = null;
  appointments.sort((a, b) {
    // Sort by start time, then end time
    if (isEqual(a.start, b.start)) {
      return a.end.compareTo(b.end);
    }
    return a.start.compareTo(b.start);
  });

  for (var appointment in appointments) {
    // Compare lastEventEnding to the start of the current event
    if (lastEventEnding == null || appointment.start.isAfter(lastEventEnding)) {
      packAppointments(columns);
      cleared = cleared + columns.expand((e) => e).toList();
      columns.clear();
      lastEventEnding = null;
    }
    bool placed = false;
    for (var col in columns) {
      if (!collidesWith(col.last.appointment,appointment)) {
        col.add(SchedulingAppointmentLayout(appointment: appointment));
        placed = true;
        break;
      }
    }
    if (!placed) {
      columns.add([SchedulingAppointmentLayout(appointment: appointment)]);
    }
    if (lastEventEnding == null || appointment.end.isAfter(lastEventEnding)) {
      lastEventEnding = appointment.end;
    }
  }
  if(columns.isNotEmpty){
    packAppointments(columns);
    cleared = cleared + columns.expand((e) => e).toList();
  }
  return cleared;
}

bool collidesWith(SchedulingAppointmentEntity a, SchedulingAppointmentEntity b) {
  return a.start.isBefore(b.end) && a.end.isAfter(b.start);
}

/// Set the left and right positions for each event in the connected group.
/// Step 4 in the algorithm.
packAppointments(List<List<SchedulingAppointmentLayout>> columns) {
  int numColumns = columns.length;
  int iColumn = 0;
  for (var col in columns) {
    for (var ev in col) {
      int colSpan = expandAppointments(ev, iColumn, columns);
      ev.left = iColumn / numColumns;
      ev.right = (iColumn + colSpan) / numColumns;
    }
    iColumn++;
  }


}

/// Checks how many columns the event can expand into, without colliding with
/// other events.
/// Step 5 in the algorithm.
int expandAppointments(SchedulingAppointmentLayout ev, int iColumn, List<List<SchedulingAppointmentLayout>> columns) {

  // Convert to Dart.

  int colSpan = 1;
  for(var col in columns.skip(iColumn + 1)){
    for(var ev1 in col){
      if(collidesWith(ev.appointment,ev1.appointment)){
        return colSpan;
      }
    }
    colSpan++;
  }
  return colSpan;


}