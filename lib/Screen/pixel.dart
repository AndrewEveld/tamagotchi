import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';

class Pixel{

  bool fixed;
  Color mainColor;
  Function() onClickFunction;
  Color currentColor;
  bool isInverse;
  double length;
  // will need grid and pet variables

  Pixel(this.fixed, this.mainColor, this.onClickFunction, this.length) {
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

  Widget pixelBuild(BuildContext context) {
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