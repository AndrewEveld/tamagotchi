import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EightBitScreen extends StatefulWidget {
  static _EightBitScreenState of(BuildContext context) => context.findAncestorStateOfType<_EightBitScreenState>();

  @override
  _EightBitScreenState createState() => _EightBitScreenState();

}

class _EightBitScreenState extends State<EightBitScreen> {
  int _screenPixelWidth = 20;
  int _screenPixelHeight = 20;
  List<List<bool>> pixelTable;

  @override
  void initState() {
    pixelTable = twoDimensionalFalseBool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            screen(),
            renderPetButton(),
          ],
        ),
      );

  }

  Widget screen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: getAllRowsOfPixels(),
    );
  }

  List<Widget> getAllRowsOfPixels() {
    List<Widget> pixelRowsToReturn = List();
    for (int i = 0; i < _screenPixelHeight; i++) {
      addRowOfPixels(pixelRowsToReturn, i);
    }
    return pixelRowsToReturn;
  }

  addRowOfPixels(List<Widget> listOfPixelRows, int rowNumber) {
    List<Widget> pixelsToAdd = List();
    for (int i = 0; i < _screenPixelWidth; i++) {
      bool isFilled = pixelTable[rowNumber][i];
      pixelsToAdd.add(pixel(isFilled));
    }
    listOfPixelRows.add(rowOfPixels(pixelsToAdd));
  }

  Widget rowOfPixels(List<Widget> pixels) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: pixels,
    );
  }

  Widget pixel(bool isFilled) {
    return
      Container(
        margin: EdgeInsets.all(1.0),
        child:  SizedBox(
          width: 10,
          height: 10,
          child: Container(
            color: isFilled ? Colors.black : Colors.green,
          ),
        ),
      );
  }

  renderPet() {
    List<int> petY = [0, 1, 2, 3, 0, 3, 0, 3, 0, 1, 2, 3, 8, 8, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 7, 8, 9, 8, 8, 8, 8, 8, 9];
    List<int> petX = [0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 3, 3, 2, 3, 4, 5, 6, 7, 8, 9, 5, 6, 7, 8, 9, 5, 7, 9, 5, 6, 7, 9, 4, 4, 4, 5, 6, 7, 8, 9, 9];
    int yOffset = 5;
    int xOffset = 5;
    setState(() {
      for (int i = 0; i < petX.length; i++) {
        pixelTable[petX[i] + xOffset][petY[i] + yOffset] = true;
      }
    });
  }

  List<List<bool>> twoDimensionalFalseBool() {
    List<List<bool>> toReturn = List();
    for (int i = 0; i < _screenPixelHeight; i++) {
      toReturn.add(List());
      for (int j = 0; j < _screenPixelWidth; j++) {
        toReturn[i].add(false);
      }
    }
    return toReturn;
  }

  Widget renderPetButton() {
    return RaisedButton(
      onPressed: renderPet,
      child: Text("Render Pet"),
    );
  }

}