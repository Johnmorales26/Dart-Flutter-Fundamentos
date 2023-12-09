import 'package:flutter/material.dart';
import 'package:task_app/models/device_type.dart';

DeviceType getDeviceType(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    print('Vista de dispositivo mobile');
    return DeviceType.Smartphone;
  } else if (screenWidth >= 600 && screenWidth < 960) {
    print('Vista de dispositivo tablet');
    return DeviceType.Tablet;
  } else if (screenWidth >= 960 && screenWidth < 1200) {
    print('Vista de computadora');
    return DeviceType.LargeScreen;
  } else {
    print('Vista de pantalla extra grande');
    return DeviceType.ExtraLargeScreen;
  }
}
