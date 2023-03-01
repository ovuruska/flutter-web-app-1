import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/modify_branch/register.dart';
import 'package:widgetbook/widgetbook.dart'
    show Apple, Device, DeviceSize, DeviceType, Resolution;
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookApp, WidgetbookTheme;


@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData darkTheme() => ThemeData.dark();

@WidgetbookApp.material(
  name: 'Quicker',
  devices: [
    Device(
      name: "iPhone 12 Pro Max",
      type: DeviceType.mobile,
      resolution: Resolution(
          nativeSize: DeviceSize(width: 428, height: 926), scaleFactor: 3),
    ),
    Device(
      name: "iPhone 12 Pro",
      type: DeviceType.mobile,
      resolution: Resolution(
          nativeSize: DeviceSize(width: 390, height: 844), scaleFactor: 3),
    ),
    Device(
      name: "iPhone 12",
      type: DeviceType.mobile,
      resolution: Resolution(
          nativeSize: DeviceSize(width: 390, height: 844), scaleFactor: 2),
    ),
    Device(
      name: "Macbook Pro",
      type: DeviceType.desktop,
      resolution: Resolution(
          nativeSize: DeviceSize(width: 1440, height: 900), scaleFactor: 1),
    )
  ],
  textScaleFactors: [
    1,
    2,
    3,
  ],
  foldersExpanded: true,
  widgetsExpanded: true,
)
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
