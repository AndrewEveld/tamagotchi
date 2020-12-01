import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/Pet/stat.dart';
import 'package:tamagotchi/Screen/Images/pet_images.dart';
import 'package:tamagotchi/Screen/pixel.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'Images/alphabet.dart';
import 'coordinate.dart';

void doNothing() {}

Pixel createBlankPixel() {
  return Pixel(false, color["light"]);
}

List<Coordinate> infoScreenInitialCoords = new List<Coordinate>();
List<bool> infoScreenInitialFixed = new List<bool>();
List<Color> infoScreenInitialColors = new List<Color>();
List<Widget Function()> infoScreenInitialOnClickFuncs = new List<Widget Function()>();

List<List<Pixel>> initiateInfoScreenPixels(int numCols, int numRows) {
  List<List<Pixel>> rows = new List<List<Pixel>>();
  for (int i = 0; i < numRows; i++) {
    List<Pixel> row = new List<Pixel>();
    for (int j = 0; j < numCols; j++) {
      if (infoScreenInitialCoords.contains(Coordinate(j, numRows-i))) {
        int index = infoScreenInitialCoords.indexOf(Coordinate(j, numRows-i));
        row.add(
            Pixel(
                infoScreenInitialFixed[index],
                infoScreenInitialColors[index]
            )
        );
      } else {
        row.add(createBlankPixel());
      }
    }
    rows.add(row);
  }
  return rows;
}