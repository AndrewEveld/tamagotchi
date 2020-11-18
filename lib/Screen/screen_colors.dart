import 'dart:ui';

import 'package:flutter/material.dart';

Map<String, Color> color = {
  "super light" : Color(0xff98b7a6),
  "light" : Color(0xff6d927f),
  "medium" : Color(0xff3d6858),
  "dark" : Colors.black
};

Map<Color, Color> inverseColor = {
  Colors.black : Color(0xff6d927f),
  Color(0xff3d6858) : Color(0xff3d6858),
  Color(0xff6d927f) : Colors.black
};