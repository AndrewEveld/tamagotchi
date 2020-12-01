import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/coordinate.dart';

enum Food {
  water,
  corn,
  apple
}

List<Coordinate> foodCoords = [
  Coordinate(0,14), Coordinate(1,14), Coordinate(2,14), Coordinate(3,14), Coordinate(4,14), Coordinate(5,14), Coordinate(6,14), Coordinate(7,14), Coordinate(8,14), Coordinate(9,14), Coordinate(10,14), Coordinate(11,14), Coordinate(12,14), Coordinate(13,14), Coordinate(14,14),
  Coordinate(0,13), Coordinate(1,13), Coordinate(2,13), Coordinate(3,13), Coordinate(4,13), Coordinate(5,13), Coordinate(6,13), Coordinate(7,13), Coordinate(8,13), Coordinate(9,13), Coordinate(10,13), Coordinate(11,13), Coordinate(12,13), Coordinate(13,13), Coordinate(14,13),
  Coordinate(0,12), Coordinate(1,12), Coordinate(2,12), Coordinate(3,12), Coordinate(4,12), Coordinate(5,12), Coordinate(6,12), Coordinate(7,12), Coordinate(8,12), Coordinate(9,12), Coordinate(10,12), Coordinate(11,12), Coordinate(12,12), Coordinate(13,12), Coordinate(14,12),
  Coordinate(0,11), Coordinate(1,11), Coordinate(2,11), Coordinate(3,11), Coordinate(4,11), Coordinate(5,11), Coordinate(6,11), Coordinate(7,11), Coordinate(8,11), Coordinate(9,11), Coordinate(10,11), Coordinate(11,11), Coordinate(12,11), Coordinate(13,11), Coordinate(14,11),
  Coordinate(0,10), Coordinate(1,10), Coordinate(2,10), Coordinate(3,10), Coordinate(4,10), Coordinate(5,10), Coordinate(6,10), Coordinate(7,10), Coordinate(8,10), Coordinate(9,10), Coordinate(10,10), Coordinate(11,10), Coordinate(12,10), Coordinate(13,10), Coordinate(14,10),
  Coordinate(0,9), Coordinate(1,9), Coordinate(2,9), Coordinate(3,9), Coordinate(4,9), Coordinate(5,9), Coordinate(6,9), Coordinate(7,9), Coordinate(8,9), Coordinate(9,9), Coordinate(10,9), Coordinate(11,9), Coordinate(12,9), Coordinate(13,9), Coordinate(14,9),
  Coordinate(0,8), Coordinate(1,8), Coordinate(2,8), Coordinate(3,8), Coordinate(4,8), Coordinate(5,8), Coordinate(6,8), Coordinate(7,8), Coordinate(8,8), Coordinate(9,8), Coordinate(10,8), Coordinate(11,8), Coordinate(12,8), Coordinate(13,8), Coordinate(14,8),
  Coordinate(0,7), Coordinate(1,7), Coordinate(2,7), Coordinate(3,7), Coordinate(4,7), Coordinate(5,7), Coordinate(6,7), Coordinate(7,7), Coordinate(8,7), Coordinate(9,7), Coordinate(10,7), Coordinate(11,7), Coordinate(12,7), Coordinate(13,7), Coordinate(14,7),
  Coordinate(0,6), Coordinate(1,6), Coordinate(2,6), Coordinate(3,6), Coordinate(4,6), Coordinate(5,6), Coordinate(6,6), Coordinate(7,6), Coordinate(8,6), Coordinate(9,6), Coordinate(10,6), Coordinate(11,6), Coordinate(12,6), Coordinate(13,6), Coordinate(14,6),
  Coordinate(0,5), Coordinate(1,5), Coordinate(2,5), Coordinate(3,5), Coordinate(4,5), Coordinate(5,5), Coordinate(6,5), Coordinate(7,5), Coordinate(8,5), Coordinate(9,5), Coordinate(10,5), Coordinate(11,5), Coordinate(12,5), Coordinate(13,5), Coordinate(14,5),
  Coordinate(0,4), Coordinate(1,4), Coordinate(2,4), Coordinate(3,4), Coordinate(4,4), Coordinate(5,4), Coordinate(6,4), Coordinate(7,4), Coordinate(8,4), Coordinate(9,4), Coordinate(10,4), Coordinate(11,4), Coordinate(12,4), Coordinate(13,4), Coordinate(14,4),
  Coordinate(0,3), Coordinate(1,3), Coordinate(2,3), Coordinate(3,3), Coordinate(4,3), Coordinate(5,3), Coordinate(6,3), Coordinate(7,3), Coordinate(8,3), Coordinate(9,3), Coordinate(10,3), Coordinate(11,3), Coordinate(12,3), Coordinate(13,3), Coordinate(14,3),
  Coordinate(0,2), Coordinate(1,2), Coordinate(2,2), Coordinate(3,2), Coordinate(4,2), Coordinate(5,2), Coordinate(6,2), Coordinate(7,2), Coordinate(8,2), Coordinate(9,2), Coordinate(10,2), Coordinate(11,2), Coordinate(12,2), Coordinate(13,2), Coordinate(14,2),
  Coordinate(0,1), Coordinate(1,1), Coordinate(2,1), Coordinate(3,1), Coordinate(4,1), Coordinate(5,1), Coordinate(6,1), Coordinate(7,1), Coordinate(8,1), Coordinate(9,1), Coordinate(10,1), Coordinate(11,1), Coordinate(12,1), Coordinate(13,1), Coordinate(14,1),
  Coordinate(0,0), Coordinate(1,0), Coordinate(2,0), Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0), Coordinate(10,0), Coordinate(11,0), Coordinate(12,0), Coordinate(13,0), Coordinate(14,0)
];

Map<Food, List<Color>> foodColors = {
  Food.water : [
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
  ],
  Food.corn : [
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["medium"], color["medium"], color["medium"], color["medium"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["dark"], color["medium"], color["medium"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
  ],
  Food.apple : [
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["dark"], color["dark"], color["dark"], color["light"], color["light"],
    color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["dark"], color["dark"], color["light"], color["light"],
    color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"],
    color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
    color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"],
  ],
};

List<Coordinate> emptyLine = [Coordinate(0,0), Coordinate(1,0), Coordinate(2,0), Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0), Coordinate(10,0), Coordinate(11,0), Coordinate(12,0), Coordinate(13,0), Coordinate(14,0)];