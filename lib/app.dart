import 'package:flutter/material.dart';
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
  foldersExpanded: false,
  widgetsExpanded: false,
)
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
