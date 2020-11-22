import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';

class Pixel {

  bool fixed;
  Color mainColor;
  Function() onClickFunction;
  Color currentColor;
  bool isInverse;
  int numCols = 60;
  int numRows = 120;
  // will need grid and pet variables

  Pixel(this.fixed, this.mainColor, this.onClickFunction) {
    currentColor = mainColor;
    isInverse = false;
  }

  void inversePixel() {
    isInverse = !isInverse;
    currentColor = inverseColor[currentColor];
  }

  void fill(Color c, Function() f) {
    if (!fixed){
      currentColor = c;
      onClickFunction = f;
    }
  }

  void empty() {
    if (!fixed){
      currentColor = mainColor;
      onClickFunction = doNothing;
    }
  }

  void doNothing() {}

  double getLength(BuildContext context) {
    if ((MediaQuery.of(context).size.width / numCols) < (MediaQuery.of(context).size.height / numRows)) {
      return (MediaQuery.of(context).size.width / numCols);
    }
    return (MediaQuery.of(context).size.height / numRows);
  }

  Widget pixelBuild(BuildContext context) {
    double length = getLength(context);
    return (GestureDetector(
      child: Container(
        margin: EdgeInsets.all(length/40),
        child:  SizedBox(
          width: 19*length/20,
          height: 19*length/20,
          child: Container(
            color: currentColor,
          ),
        ),
      ),
      onTap: () {
        onClickFunction();
      },
    ));
  }

}