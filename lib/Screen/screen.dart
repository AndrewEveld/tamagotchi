import 'package:tamagotchi/Pet/pet.dart';
import 'package:tamagotchi/Screen/pixel.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/initial_screens.dart';
import 'package:tamagotchi/Screen/coordinate.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  static _ScreenState of(BuildContext context) => context.findAncestorStateOfType<_ScreenState>();

  @override
  _ScreenState createState() => _ScreenState();

}

class _ScreenState extends State<Screen> {

  Pet pet;
  List<List<Pixel>> startScreenPixels;
  List<List<Pixel>> petScreenPixels;
  List<List<Pixel>> gameScreenPixels;
  List<List<Pixel>> infoScreenPixels;
  List<List<List<Pixel>>> screens;
  int currentScreen;
  bool isInverse = false;
  int numCols = 60;
  int numRows = 120;

  @override
  void initState() {
    super.initState();
    initiateScreenPixels();
    screens = new List<List<List<Pixel>>>();
    screens.add(startScreenPixels);
    screens.add(petScreenPixels);
    screens.add(gameScreenPixels);
    screens.add(infoScreenPixels);
    currentScreen = 0;
  }

  void initiateScreenPixels() {
    startScreenPixels = initiateStartScreenPixels(numCols, numRows);
    petScreenPixels = initiatePetScreenPixels(numCols, numRows);
    gameScreenPixels = initiateGameScreenPixels(numCols, numRows);
    infoScreenPixels = initiateInfoScreenPixels(numCols, numRows);
  }

  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return (
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: color["super light"],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: getRows())
      )
    );
  }

  List<Widget> getRows() {
    List<Widget> rows = new List<Widget>();
    for (List<Pixel> l in screens[currentScreen]) {
      List<Widget> row = new List<Widget>();
      for (Pixel p in l) {
        row.add(p.pixelBuild(context));
      }
      rows.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: row));
    }
    return rows;
  }

  void inverse(int slept) {
    for (List<Pixel> l in petScreenPixels) {
      for (Pixel p in l) {
        p.inversePixel();
      }
    }
    if (!isInverse) {
      pet.sleep(slept);
    } else {
      pet.wakeUp();
    }
    isInverse = !isInverse;
  }

  void fillPixels(List<Coordinate> coords, List<Color> colors, Function() onClick, int xOffset, int yOffset) {
    for (int i = 0; i < coords.length; i++) {
      if ((0 <= coords[i].y + yOffset - numRows) && (coords[i].y + yOffset - numRows < 120) &&
          (0 <= coords[i].x + xOffset - numCols) && (coords[i].x + xOffset - numCols < 60)) {
        screens[currentScreen][coords[i].y + yOffset - numRows][coords[i].x + xOffset - numCols].fill(colors[i], onClick);
      }
    }
  }

  void emptyPixels(List<Coordinate> coords, int xOffset, int yOffset) {
    for (int i = 0; i < coords.length; i++) {
      screens[currentScreen][coords[i].y + yOffset - numRows][coords[i].x + xOffset - numCols].empty();
    }
  }

}