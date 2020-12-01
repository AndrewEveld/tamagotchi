import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/Screen/screen_colors.dart';

class Pixel {

  bool fixed;
  Color mainColor;
  Color currentColor;
  bool isInverse = false;


  Pixel(this.fixed, this.mainColor) {
    currentColor = mainColor;
  }

  void inversePixel() {
    if (!fixed) {
      isInverse = !isInverse;
      currentColor = inverseColor[currentColor];
    }
  }

  void fill(Color c) {
    if (!fixed){
      currentColor = c;
    }
  }

  void empty() {
    if (!fixed){
      currentColor = mainColor;
    }
  }

}