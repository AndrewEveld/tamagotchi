import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/coordinate.dart';

List<Coordinate> bathCoordsBase = [Coordinate(0,2), Coordinate(1,2), Coordinate(2,1), Coordinate(3,0), Coordinate(4,0), Coordinate(5,1)];

List<Coordinate> getBathCoords() {
  List<Coordinate> coords = new List<Coordinate>();
  for (int i = 0; i < 13; i++) {
    for (Coordinate c in bathCoordsBase) {
      if ((c.x + (5 * i)) < 75) {
        coords.add(Coordinate(c.x + (6 * i), c.y));
      }
    }
  }
  return coords;
}

List<Color> getBathColors() {
  List<Color> colors = new List<Color>();
  for (int i = 0; i < 75; i++) {
    colors.add(color["medium"]);
  }
  return colors;
}

List<Coordinate> poopCoords = [
  Coordinate(7,13),
  Coordinate(6,12),
  Coordinate(3,11), Coordinate(7,11), Coordinate(11,11),
  Coordinate(4,10), Coordinate(12,10),
  Coordinate(3,9), Coordinate(7,9), Coordinate(11,9),
  Coordinate(8,8),
  Coordinate(7,7), Coordinate(8,7), Coordinate(9,7),
  Coordinate(6,6), Coordinate(7,6), Coordinate(8,6), Coordinate(9,6), Coordinate(10,6),
  Coordinate(4,5), Coordinate(5,5), Coordinate(6,5), Coordinate(7,5), Coordinate(8,5), Coordinate(9,5), Coordinate(10,5), Coordinate(11,5), Coordinate(12,5),
  Coordinate(3,4), Coordinate(4,4), Coordinate(5,4), Coordinate(6,4), Coordinate(7,4), Coordinate(8,4), Coordinate(9,4), Coordinate(10,4), Coordinate(11,4), Coordinate(12,4), Coordinate(13,4),
  Coordinate(1,3), Coordinate(2,3), Coordinate(3,3), Coordinate(4,3), Coordinate(5,3), Coordinate(6,3), Coordinate(7,3), Coordinate(8,3), Coordinate(9,3), Coordinate(10,3), Coordinate(11,3), Coordinate(12,3), Coordinate(13,3), Coordinate(14,3),
  Coordinate(0,2), Coordinate(1,2), Coordinate(2,2), Coordinate(3,2), Coordinate(4,2), Coordinate(5,2), Coordinate(6,2), Coordinate(7,2), Coordinate(8,2), Coordinate(9,2), Coordinate(10,2), Coordinate(11,2), Coordinate(12,2), Coordinate(13,2), Coordinate(14,2), Coordinate(15,2),
  Coordinate(0,1), Coordinate(1,1), Coordinate(2,1), Coordinate(3,1), Coordinate(4,1), Coordinate(5,1), Coordinate(6,1), Coordinate(7,1), Coordinate(8,1), Coordinate(9,1), Coordinate(10,1), Coordinate(11,1), Coordinate(12,1), Coordinate(13,1), Coordinate(14,1), Coordinate(15,1),
  Coordinate(1,0), Coordinate(2,0), Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0), Coordinate(10,0), Coordinate(11,0), Coordinate(12,0), Coordinate(13,0), Coordinate(14,0)
];

List<Color> poopColors = [
  color["dark"],
  color["dark"],
  color["dark"], color["dark"], color["dark"],
  color["dark"], color["dark"],
  color["dark"], color["dark"], color["dark"],
  color["dark"],
  color["dark"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["dark"], color["medium"], color["medium"], color["light"], color["light"], color["medium"], color["dark"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["dark"], color["medium"], color["medium"], color["light"], color["light"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"]
];