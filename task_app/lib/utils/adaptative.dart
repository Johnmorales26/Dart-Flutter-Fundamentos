import 'package:flutter/material.dart';
import 'package:task_app/models/device_type.dart';

DeviceType getDeviceType(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return DeviceType.smartphone;
  } else if (screenWidth >= 600 && screenWidth < 960) {
    return DeviceType.tablet;
  } else if (screenWidth >= 960 && screenWidth < 1200) {
    return DeviceType.largeScreen;
  } else {
    return DeviceType.extraLargeScreen;
  }
}
