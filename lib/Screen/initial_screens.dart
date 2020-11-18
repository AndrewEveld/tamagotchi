import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/Screen/pixel.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'coordinate.dart';

void doNothing() {}

Pixel createBlankPixel(double length) {
  return Pixel(false, color["light"], doNothing, length);
}

List<Coordinate> startScreenInitialCoords = new List<Coordinate>();
List<bool> startScreenInitialFixed = new List<bool>();
List<Color> startScreenInitialColors = new List<Color>();
List<Widget Function()> startScreenInitialOnClickFuncs = new List<Widget Function()>();

List<List<Pixel>> initiateStartScreenPixels(double length, int numRows) {
  List<List<Pixel>> rows = new List<List<Pixel>>();
  for (int i = 0; i < numRows; i++) {
    List<Pixel> row = new List<Pixel>();
    for (int j = 0; j < 120; j++) {
      if (startScreenInitialCoords.contains(Coordinate(120-j, numRows-i))) {
        int index = startScreenInitialCoords.indexOf(Coordinate(120-j, numRows-i));
        row.add(
            Pixel(
                startScreenInitialFixed[index],
                startScreenInitialColors[index],
                startScreenInitialOnClickFuncs[index],
                length
            )
        );
      } else {
        row.add(createBlankPixel(length));
      }
    }
    rows.add(row);
  }
  return rows;
}

List<Coordinate> petScreenInitialCoords = new List<Coordinate>();
List<bool> petScreenInitialFixed = new List<bool>();
List<Color> petScreenInitialColors = new List<Color>();
List<Widget Function()> petScreenInitialOnClickFuncs = new List<Widget Function()>();

List<List<Pixel>> initiatePetScreenPixels(double length, int numRows) {
  List<List<Pixel>> rows = new List<List<Pixel>>();
  for (int i = 0; i < numRows; i++) {
    List<Pixel> row = new List<Pixel>();
    for (int j = 0; j < 120; j++) {
      if (petScreenInitialCoords.contains(Coordinate(120-j, numRows-i))) {
        int index = petScreenInitialCoords.indexOf(Coordinate(120-j, numRows-i));
        row.add(
            Pixel(
                petScreenInitialFixed[index],
                petScreenInitialColors[index],
                petScreenInitialOnClickFuncs[index],
                length
            )
        );
      } else {
        row.add(createBlankPixel(length));
      }
    }
    rows.add(row);
  }
  return rows;
}

List<Coordinate> gameScreenInitialCoords = new List<Coordinate>();
List<bool> gameScreenInitialFixed = new List<bool>();
List<Color> gameScreenInitialColors = new List<Color>();
List<Widget Function()> gameScreenInitialOnClickFuncs = new List<Widget Function()>();

List<List<Pixel>> initiateGameScreenPixels(double length, int numRows) {
  List<List<Pixel>> rows = new List<List<Pixel>>();
  for (int i = 0; i < numRows; i++) {
    List<Pixel> row = new List<Pixel>();
    for (int j = 0; j < 120; j++) {
      if (gameScreenInitialCoords.contains(Coordinate(120-j, numRows-i))) {
        int index = gameScreenInitialCoords.indexOf(Coordinate(120-j, numRows-i));
        row.add(
            Pixel(
                gameScreenInitialFixed[index],
                gameScreenInitialColors[index],
                gameScreenInitialOnClickFuncs[index],
                length
            )
        );
      } else {
        row.add(createBlankPixel(length));
      }
    }
    rows.add(row);
  }
  return rows;
}

List<Coordinate> infoScreenInitialCoords = new List<Coordinate>();
List<bool> infoScreenInitialFixed = new List<bool>();
List<Color> infoScreenInitialColors = new List<Color>();
List<Widget Function()> infoScreenInitialOnClickFuncs = new List<Widget Function()>();

List<List<Pixel>> initiateInfoScreenPixels(double length, int numRows) {
  List<List<Pixel>> rows = new List<List<Pixel>>();
  for (int i = 0; i < numRows; i++) {
    List<Pixel> row = new List<Pixel>();
    for (int j = 0; j < 120; j++) {
      if (infoScreenInitialCoords.contains(Coordinate(120-j, numRows-i))) {
        int index = infoScreenInitialCoords.indexOf(Coordinate(120-j, numRows-i));
        row.add(
            Pixel(
                infoScreenInitialFixed[index],
                infoScreenInitialColors[index],
                infoScreenInitialOnClickFuncs[index],
                length
            )
        );
      } else {
        row.add(createBlankPixel(length));
      }
    }
    rows.add(row);
  }
  return rows;
}