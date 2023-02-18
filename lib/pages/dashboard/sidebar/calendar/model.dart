

class SidebarCalendarModel {
  DateTime selectedDate = DateTime.now();
  bool expanded = false;

  toggleExpanded() {
    expanded = !expanded;
    return this;
  }

  setDate(DateTime date) {
    selectedDate = date;
    return this;
  }
}