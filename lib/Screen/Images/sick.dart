import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/coordinate.dart';

List<Coordinate> sickSymbolCoords = [
  Coordinate(3,12), Coordinate(4,12), Coordinate(5,12), Coordinate(6,12), Coordinate(7,12), Coordinate(8,12), Coordinate(9,12),
  Coordinate(2,11), Coordinate(10,11),
  Coordinate(1,10), Coordinate(11,10),
  Coordinate(1,9), Coordinate(11,9),
  Coordinate(0,8), Coordinate(12,8),
  Coordinate(0,7), Coordinate(3,7), Coordinate(4,7), Coordinate(8,7), Coordinate(9,7), Coordinate(12,7),
  Coordinate(0,6), Coordinate(3,6), Coordinate(4,6), Coordinate(8,6), Coordinate(9,6), Coordinate(12,6),
  Coordinate(0,5), Coordinate(6,5), Coordinate(12,5),
  Coordinate(1,4), Coordinate(6,4), Coordinate(11,4),
  Coordinate(1,3),  Coordinate(2,3), Coordinate(10,3), Coordinate(11,3),
  Coordinate(2,2), Coordinate(10,2),
  Coordinate(2,1), Coordinate(4,1), Coordinate(6,1), Coordinate(8,1), Coordinate(10,1),
  Coordinate(2,0), Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0), Coordinate(10,0)
];

List<Color> sickSymbolColors = [
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"]
];

List<Coordinate> syringeCoords = [
  Coordinate(3,4), Coordinate(4,4), Coordinate(5,4), Coordinate(6,4), Coordinate(7,4), Coordinate(8,4), Coordinate(9,4), Coordinate(10,4), Coordinate(11,4),
  Coordinate(3,3), Coordinate(11,3),
  Coordinate(0,2), Coordinate(1,2), Coordinate(2,2), Coordinate(3,2), Coordinate(11,2),
  Coordinate(3,1), Coordinate(5,1), Coordinate(7,1), Coordinate(9,1), Coordinate(11,1),
  Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0), Coordinate(10,0), Coordinate(11,0)
];

List<Color> syringeColors = [
  color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"],
  color["medium"], color["medium"],
  color["dark"], color["dark"], color["dark"], color["medium"], color["medium"],
  color["medium"], color["medium"], color["medium"], color["medium"], color["medium"],
  color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"]
];

List<List<Coordinate>> syringePumpCoords = [
  [Coordinate(16,3), Coordinate(12,2), Coordinate(13,2), Coordinate(14,2), Coordinate(15,2), Coordinate(16,2), Coordinate(16,1)],
  [Coordinate(15,3), Coordinate(12,2), Coordinate(13,2), Coordinate(14,2), Coordinate(15,2), Coordinate(15,1)],
  [Coordinate(14,3), Coordinate(12,2), Coordinate(13,2), Coordinate(14,2), Coordinate(14,1)],
  [Coordinate(13,3), Coordinate(12,2), Coordinate(13,2), Coordinate(13,1)]
];

List<List<Color>> syringePumpColors = [
  [color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"]],
  [color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"]],
  [color["dark"], color["dark"], color["dark"], color["dark"], color["dark"]],
  [ color["dark"], color["dark"], color["dark"], color["dark"]]
];
