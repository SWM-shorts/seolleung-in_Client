import 'dart:ui';

import 'package:flutter/material.dart';

Size displaySizeWithContext(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeightWithContext(BuildContext context) {
  return displaySizeWithContext(context).height;
}

double displayWidthWithContext(BuildContext context) {
  return displaySizeWithContext(context).width;
}

double displayWidthWithoutContext() {
  return (window.physicalSize / window.devicePixelRatio).width;
}

double displayHeightWithoutContext() {
  return (window.physicalSize / window.devicePixelRatio).height;
}
