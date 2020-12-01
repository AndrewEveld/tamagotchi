import 'dart:async';

import 'package:tamagotchi/Pet/pet.dart';
import 'package:tamagotchi/Pet/stat.dart';
import 'package:tamagotchi/Screen/Images/alphabet.dart';
import 'package:tamagotchi/Screen/Images/sick.dart';
import 'package:tamagotchi/Screen/pixel.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/initial_screens.dart';
import 'package:tamagotchi/Screen/coordinate.dart';
import 'package:flutter/material.dart';

import 'Images/bath.dart';
import 'Images/button_icons.dart';
import 'Images/food.dart';
import 'Images/pet_images.dart';

class Screen extends StatefulWidget {
  static _ScreenState of(BuildContext context) => context.findAncestorStateOfType<_ScreenState>();

  @override
  _ScreenState createState() => _ScreenState();

}

class _ScreenState extends State<Screen> {

  Pet pet;
  List<List<Pixel>> startScreenPixels;
  List<List<Function()>> startScreenFuncs;
  List<List<Pixel>> petScreenPixels;
  List<List<Function()>> petScreenFuncs;
  List<List<Pixel>> infoScreenPixels;
  List<List<Function()>> infoScreenFuncs;
  List<List<List<Pixel>>> screens;
  List<List<List<Function()>>> screensFuncs;
  int currentScreen;
  bool isInverse = false;
  bool ongoingAction = false;
  bool isSick = false;
  bool pooped = false;
  bool started = false;
  bool fst = true;
  int numCols = 75;
  int numRows = 120;

  @override
  void initState() {
    super.initState();
    initiateScreens();
    screens = [startScreenPixels, petScreenPixels, infoScreenPixels];
    screensFuncs = [startScreenFuncs, petScreenFuncs, infoScreenFuncs];
    currentScreen = 0;
  }

  void initiateScreens() {
    startScreenPixels = new List<List<Pixel>>();
    petScreenPixels = new List<List<Pixel>>();
    infoScreenPixels = new List<List<Pixel>>();
    startScreenFuncs = new List<List<Function()>>();
    petScreenFuncs = new List<List<Function()>>();
    infoScreenFuncs = new List<List<Function()>>();
  }

  Pixel createBlankPixel() {
    return Pixel(false, color["light"]);
  }

  void initiateStartScreen() {
    for (int i = 0; i < numRows; i++) {
      List<Pixel> row = new List<Pixel>();
      List<Function()> rowFuncs = new List<Function()>();
      for (int j = 0; j < numCols; j++) {
        row.add(createBlankPixel());
        rowFuncs.add(doNothing);
      }
      setState(() {
        startScreenPixels.add(row);
        startScreenFuncs.add(rowFuncs);
      });
    }
  }

  void initiatePetScreenPixels() {
    Map<String, Function()> iconFuncs = {
      "feed" : chooseFood,
      "sleep" : sleep,
      "bathe" : bath,
      "heal" : heal,
      "info" : goToInfo
    };
    List<Coordinate> initialCoords = new List<Coordinate>();
    List<bool> initialFixed = new List<bool>();
    List<Color> initialColors = new List<Color>();
    List<Function ()> initialFuncs = new List<Function()>();

    // add pet stats to pet viewing screen
    for (Stats s in Stats.values) {
      initialCoords.addAll(offsetCoords(getWordCoords(statString[s]), statXOffset[s], statYOffset[s]));
      initialColors.addAll(getWordColors(statString[s]));
      for (Color c in getWordColors(statString[s])) {
        initialFixed.add(false);
        initialFuncs.add(doNothing);
      }
    }

    // add buttons to pet viewing screen
    for (int i = 0; i < icons.length; i++) {
      initialCoords.addAll(offsetCoords(iconCoords, i * 15, 0));
      initialColors.addAll(iconColors[icons[i]]);
      for (int j = 0; j < iconCoords.length; j++ ) {
        initialFixed.add(true);
        initialFuncs.add(iconFuncs[icons[i]]);
      }
    }

    // create pet viewing screen pixels and add to list,
    // add onClick  functions to list  at matching indices
    for (int i = 0; i < numRows; i++) {
      List<Pixel> row = new List<Pixel>();
      List<Function()> rowFuncs = new List<Function()>();
      for (int j = 0; j < numCols; j++) {
        int y = numRows - 1 - i;
        int x = j;
        if (initialCoords.contains(Coordinate(x,y))){
          int index = initialCoords.indexOf(Coordinate(x,y));
          row.add(Pixel(initialFixed[index], initialColors[index]));
          rowFuncs.add(initialFuncs[index]);
        } else {
          row.add(createBlankPixel());
          rowFuncs.add(doNothing);
        }
      }
      petScreenPixels.add(row);
      petScreenFuncs.add(rowFuncs);
    }
  }


  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    refresh();
    return (
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: color["super light"],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: getRows(context))
      )
    );
  }

  void refresh() {
    if (started) {
      drawPet();
      pet.refreshPet();
      emptyStatBars();
      fillStatBars();
      if (((isSick == false) && (pet.petIsSick == true)) && currentScreen == 1)  {
        sick();
      }
      if (((pooped == false) && (pet.hasPooped == true)) && currentScreen == 1)  {
        poop();
      }
    } else if (startScreenPixels.length == 0) {
      initiateStartScreen();
      start();
    }
  }

  List<Widget> getRows(BuildContext context) {
    double length = getLength(context);
    List<Widget> rows = new List<Widget>();
    for (int i = 0; i < screens[currentScreen].length; i++) {
      List<Widget> row = new List<Widget>();
      for (int j = 0; j < screens[currentScreen][i].length; j++) {
        row.add(
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(length/40),
                child:  SizedBox(
                  width: 19*length/20,
                  height: 19*length/20,
                  child: Container(
                    color: screens[currentScreen][i][j].currentColor,
                  ),
                ),
              ),
              onTap: () {screensFuncs[currentScreen][i][j]();}
            )
        );
      }
      rows.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: row));
    }
    return rows;
  }

  double getLength(BuildContext context) {
    if ((MediaQuery.of(context).size.width / numCols) < (MediaQuery.of(context).size.height / numRows)) {
      return (MediaQuery.of(context).size.width / numCols);
    }
    return (MediaQuery.of(context).size.height / numRows);
  }

  void emptyStatBars() {
    for (Stats s in Stats.values) {
      emptyPixels(statBarCoords, statXOffset[s], statYOffset[s] -  3);
    }
  }

  void fillStatBars() {
    for (Stats s in Stats.values) {
      List<Coordinate> coords = new List<Coordinate>();
      List<Color> colors = new List<Color>();
      for (int i = 0; i < (pet.petStats.statsMap[s].value).round(); i++) {
        coords.addAll(statBarIncrementedCoords[i]);
        colors.addAll(statBarIncrementedColors);
      }
      fillPixels(coords, colors, doNothing, statXOffset[s], statYOffset[s] - 3);
    }
  }

  void start() {
    print("start");
    List<Coordinate> startButtonCoords = getWordCoords("START");
    List<Color> startButtonColors = getWordColors("START");
    fillPixels(startButtonCoords, startButtonColors, egg, 20, 55);
  }

  void egg() {
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        screens[0][i][j].empty();
        screensFuncs[0][i][j] = doNothing;
      }
    }
    for (int i = 0; i < eggCoords.length; i++) {
      List<Color> colors = new List<Color>();
      for (int j = 0; j < eggCoords[i].length; j++) {
        colors.add(eggColors[i]);
      }
      fillPixels(eggCoords[i], colors, doNothing, 0, 0);
      new Timer(const Duration(seconds: 1), () => doNothing());
    }
    pet = new Pet();
    initiatePetScreenPixels();
    started = true;
    goToPet();
  }

  void drawPet() {
    if (!isInverse) {
      fillPixels(petCoords, petAwakeColors, givePets, 0, 0);
    } else {
      fillPixels(petCoords, petAsleepColors, givePets, 0, 0);
    }
  }

  void sleep() {
    if (!ongoingAction || isInverse) {
      setState(() {
        for (List<Pixel> l in petScreenPixels) {
          for (Pixel p in l) {
            p.inversePixel();
          }
        }
      });
      if (!isInverse) {
        pet.sleep();
      } else {
        pet.wakeUp();
      }
      isInverse = !isInverse;
      ongoingAction = !ongoingAction;
    }
  }

  void bath() {
    if (!ongoingAction) {
      ongoingAction = true;
      List<Coordinate> bathCoords = getBathCoords();
      List<Color> bathColors = getBathColors();
      for (int i = 95; i > 11; i--) {
        emptyPixels(bathCoords, 0, i + 1);
        fillPixels(bathCoords, bathColors, doNothing, 0, i);
        new Timer(const Duration(milliseconds: 50), () => doNothing());
      }
      ongoingAction = false;
      pet.bathe();
    }
  }

  void poop() {
    pooped = true;
    fillPixels(poopCoords, poopColors, doNothing, 53, 25);
  }

  void chooseFood() {
    Map<Food, Function()> foodFuncs = {
      Food.water : drinkWater,
      Food.corn : eatCorn,
      Food.apple : eatApple
    };
    if (!ongoingAction) {
      ongoingAction = true;
      for (int i = 0; i < Food.values.length; i++) {
        fillPixels(foodCoords, foodColors[Food.values[i]], foodFuncs[Food.values[i]], 6, 15 + (15 * i));
      }
    }
  }

  void drinkWater() {eat(Food.water);}

  void eatCorn() {eat(Food.corn);}

  void eatApple() {eat(Food.apple);}

  void eat(Food f) {
    for (int i = 0; i < Food.values.length; i++) {
      emptyPixels(foodCoords, 6, 15 + (15 * i));
    }
    fillPixels(foodCoords, foodColors[f], doNothing, 9, 35);
    for (int i = 49; i > 34; i--) {
      new Timer(const Duration(milliseconds: 300), () => doNothing());
      emptyPixels(emptyLine, 9, i);
    }
    pet.eat(3);
    ongoingAction = false;
  }

  void sick() {
    isSick = true;
    fillPixels(sickSymbolCoords, sickSymbolColors, doNothing, 50, 80);
  }

  void heal() {
    if (!ongoingAction) {
      ongoingAction = true;
      fillPixels(syringeCoords, syringeColors, doNothing, 46, 36);
      for (int i = 0; i < syringePumpCoords.length; i++) {
        fillPixels(syringePumpCoords[i], syringePumpColors[i], doNothing, 46, 36);
        new Timer(const Duration(seconds: 1), () => doNothing());
        emptyPixels(syringePumpCoords[i], 46, 36);
      }
      emptyPixels(syringeCoords, 46, 36);
      ongoingAction = false;
      pet.giveMedicine();
      isSick = false;
    }
  }

  void givePets() {
    if (!ongoingAction) {
      ongoingAction = true;
      for (int i = 0; i < heartCoords.length; i++) {
        fillPixels(heartCoords[i], heartColors[i], doNothing, 32, 70);
        new Timer(const Duration(milliseconds: 750), () => doNothing());
      }
      emptyPixels(heartCoords[1], 32, 70);
      ongoingAction = false;
      pet.hadFun(1);
    }
  }

  void goToPet() {
    setState(() {
      currentScreen = 1;
    });
  }

  void goToInfo() {
    if (!ongoingAction) {
      setState(() {
        currentScreen = 2;
      });
    }
  }

  void fillPixels(List<Coordinate> coords, List<Color> colors, Function() onClick, int xOffset, int yOffset) {
    print("start");
    setState(() {
      for (int i = 0; i < coords.length; i++) {
        int Y = numRows - 1 - (coords[i].y + yOffset);
        int X = coords[i].x + xOffset;
        if (((0 <= Y)) && (Y < numRows) &&
            (0 <= X) && (X < numCols)) {
          screens[currentScreen][Y][X].fill(colors[i]);
          screensFuncs[currentScreen][Y][X] = onClick;
        }
      }
    });
  }

  void emptyPixels(List<Coordinate> coords, int xOffset, int yOffset) {
    setState(() {
      for (int i = 0; i < coords.length; i++) {
        int Y = numRows - 1 - (coords[i].y + yOffset);
        int X = coords[i].x + xOffset;
        if (((0 <= Y)) && (Y < numRows) &&
            (0 <= X) && (X < numCols)) {
          if (!screens[currentScreen][Y][X].fixed) {
            screens[currentScreen][Y][X].empty();
            screensFuncs[currentScreen][Y][X]  = doNothing;
          }
        }
      }
    });
  }

  List<Coordinate> offsetCoords(List<Coordinate> c,  int x, int y) {
    List<Coordinate> coords = new List<Coordinate>();
    for (Coordinate coord in c) {
      coords.add(Coordinate(coord.x + x, coord.y + y));
    }
    return coords;
  }

  List<Coordinate> getWordCoords(String word) {
    List<String> w = word.split("");
    List<Coordinate> coords = new List<Coordinate>();
    int width = 0;
    for (int i = 0; i < w.length; i++) {
      print(w[i]);
      coords.addAll(offsetCoords(alphabetCoords[w[i]], width, 0));
      width += (alphabetWidth[w[i]] + 1);
    }
    return coords;
  }

  List<Color> getWordColors(String word) {
    List<String> w = word.split("");
    List<Color> colors = new List<Color>();
    for (int i = 0; i < w.length; i++) {
      colors.addAll(alphabetColors[w[i]]);
    }
    return colors;
  }

}
