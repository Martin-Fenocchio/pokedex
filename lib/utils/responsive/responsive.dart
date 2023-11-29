import 'package:flutter/material.dart';

double mediaWidth(BuildContext context, num media) {
  return media * MediaQuery.of(context).size.width / 100;
}

double mediaHeight(BuildContext context, num media) {
  return media * MediaQuery.of(context).size.height / 100;
}

extension ResponsiveExtensionContext on BuildContext {
  double h(double value) => mediaHeight(this, value);
  double w(double value) => mediaWidth(this, value);
}

extension DeviceInt on int {
  double h(BuildContext context) => mediaHeight(context, this);
  double w(BuildContext context) => mediaWidth(context, this);
}

extension DeviceDouble on double {
  double h(BuildContext context) => mediaHeight(context, this);
  double w(BuildContext context) => mediaWidth(context, this);
}
