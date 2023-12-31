import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrubbers_employee_application/common/DateUtils.dart';
import 'package:scrubbers_employee_application/flutter_flow/flutter_flow_theme.dart';
import 'package:table_calendar/table_calendar.dart';


DateTime kFirstDay = DateTime(1970, 1, 1);
DateTime kLastDay = DateTime(2100, 1, 1);

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

bool isSameMonth(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }
  return a.year == b.year && a.month == b.month;
}

class ControlledCalendar extends StatefulWidget {
  ControlledCalendar({
    Key? key,
    this.onChange,
    this.disableNavigation = false,
    this.initialDate,
    this.weekFormat = false,
    this.weekStartsMonday = false,
    this.iconColor,
    this.dateStyle,
    this.dayOfWeekStyle,
    this.inactiveDateStyle,
    this.selectedDateStyle,
    this.titleStyle,
    this.rowHeight = 32,
    this.locale,
    this.selectedDay,
    this.decorate = true,

  }) : super(key: key);

  final bool disableNavigation;
  final bool weekFormat;
  final bool weekStartsMonday;
  final void Function(DateTime?)? onChange;
  final DateTime? initialDate;
  final Color? iconColor;
  final TextStyle? dateStyle;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? inactiveDateStyle;
  final TextStyle? selectedDateStyle;
  final TextStyle? titleStyle;
  final double? rowHeight;
  final String? locale;
  final bool decorate;
  DateTime? selectedDay;

  @override
  State<StatefulWidget> createState() => _ControlledCalendarState();
}

class _ControlledCalendarState extends State<ControlledCalendar> {
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    focusedDay = widget.selectedDay ?? widget.initialDate ?? DateTime.now();


  }

  CalendarFormat get calendarFormat =>
      widget.weekFormat ? CalendarFormat.week : CalendarFormat.month;

  StartingDayOfWeek get startingDayOfWeek => widget.weekStartsMonday
      ? StartingDayOfWeek.monday
      : StartingDayOfWeek.sunday;


  get selectedRange => DateTimeRange(
        start: widget.selectedDay!.startOfDay,
        end: widget.selectedDay!.endOfDay,
      );

  void setSelectedDay(
    DateTime? newSelectedDay, [
    DateTime? newSelectedEnd,
  ]) {
    if (widget.onChange != null) {
      widget.onChange!(newSelectedDay?.startOfDay );
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CalendarHeader(
            disableNavigation: widget.disableNavigation,
            focusedDay: focusedDay,
            onLeftChevronTap: () => setState(
              () => focusedDay = widget.weekFormat
                  ? _previousWeek(focusedDay)
                  : _previousMonth(focusedDay),
            ),
            onRightChevronTap: () => setState(
              () => focusedDay = widget.weekFormat
                  ? _nextWeek(focusedDay)
                  : _nextMonth(focusedDay),
            ),
            onTodayButtonTap: () => setState(() => focusedDay = DateTime.now()),
            titleStyle: widget.titleStyle,
            iconColor: widget.iconColor,
            locale: widget.locale,
          ),
          TableCalendar(
            focusedDay: focusedDay,
            selectedDayPredicate: (date) =>
                isSameDay(widget.selectedDay, date),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: calendarFormat,
            headerVisible: false,
            locale: widget.locale,
            rowHeight:
                widget.rowHeight ?? MediaQuery.of(context).size.width / 7,
            calendarStyle: CalendarStyle(
              defaultTextStyle:
                  widget.dateStyle ?? const TextStyle(color: Color(0xFF5A5A5A)),
              weekendTextStyle: widget.dateStyle ??
                  const TextStyle(color: const Color(0xFF5A5A5A)),
              holidayTextStyle: widget.dateStyle ??
                  const TextStyle(color: const Color(0xFF5C6BC0)),
              selectedTextStyle: widget.decorate ?
                  const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                      .merge(widget.selectedDateStyle) : TextStyle(),
              todayTextStyle:
                  const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                      .merge(widget.selectedDateStyle),
              outsideTextStyle: const TextStyle(color: Color(0xFF9E9E9E))
                  .merge(widget.inactiveDateStyle),
              selectedDecoration: widget.decorate ? BoxDecoration(
                color:FlutterFlowTheme.of(context).primaryColor,
                shape: BoxShape.circle,
              ) : BoxDecoration(),
              todayDecoration: widget.decorate ? BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor.withOpacity(0.60),
                shape: BoxShape.circle,
              ) : BoxDecoration(),
              markerDecoration:  widget.decorate ? BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryColor.withOpacity(0.85),
                shape: BoxShape.circle,
              ) : BoxDecoration(),
              markersMaxCount: 3,
              canMarkersOverflow: true,
            ),
            availableGestures: (widget.disableNavigation) ? AvailableGestures.none:AvailableGestures.horizontalSwipe,
            startingDayOfWeek: startingDayOfWeek,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: const TextStyle(color: Color(0xFF616161))
                  .merge(widget.dayOfWeekStyle),
              weekendStyle: const TextStyle(color: Color(0xFF616161))
                  .merge(widget.dayOfWeekStyle),
            ),
            onDaySelected: (newSelectedDay, _) {
                setSelectedDay(newSelectedDay);
            },
          ),
        ],
      );
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onTodayButtonTap,
    this.iconColor,
    this.titleStyle,
    this.locale,
    this.disableNavigation = false,
  }) : super(key: key);

  final DateTime focusedDay;
  final bool disableNavigation;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onTodayButtonTap;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final String? locale;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                DateFormat.yMMMM(locale).format(focusedDay),
                style: const TextStyle(fontSize: 17).merge(titleStyle),
              ),
            ),
            (disableNavigation) ? Container() :
            CustomIconButton(
              icon: Icon(Icons.calendar_today, color: iconColor),
              onTap: onTodayButtonTap,
            ),
            (disableNavigation) ? Container() :
            CustomIconButton(
              icon: Icon(Icons.chevron_left, color: iconColor),
              onTap: onLeftChevronTap,
            ),
            (disableNavigation) ? Container() :
            CustomIconButton(
              icon: Icon(Icons.chevron_right, color: iconColor),
              onTap: onRightChevronTap,
            ),
          ],
        ),
      );
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: padding,
            child: Icon(
              icon.icon,
              color: icon.color,
              size: icon.size,
            ),
          ),
        ),
      );
}

DateTime _previousWeek(DateTime week) {
  return week.subtract(const Duration(days: 7));
}

DateTime _nextWeek(DateTime week) {
  return week.add(const Duration(days: 7));
}

DateTime _previousMonth(DateTime month) {
  if (month.month == 1) {
    return DateTime(month.year - 1, 12);
  } else {
    return DateTime(month.year, month.month - 1);
  }
}

DateTime _nextMonth(DateTime month) {
  if (month.month == 12) {
    return DateTime(month.year + 1, 1);
  } else {
    return DateTime(month.year, month.month + 1);
  }
}
