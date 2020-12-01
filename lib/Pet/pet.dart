import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'stat.dart';

class Pet {
  PetStats petStats;
  bool hasPooped;
  bool petIsSick;
  bool petExists;
  DateTime timeBorn;

  Pet() {
    petStats = PetStats();
    hasPooped = false;
    timeBorn = DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'petStats': petStats.toJson(),
      'hasPooped': hasPooped,
      'petIsSick': petIsSick,
      'timeBorn': timeBorn.toString(),
    };
  }

  Pet.fromJson(Map<String, dynamic> json)
      : petStats = PetStats.fromJson(json['petStats']),
        hasPooped = json['hasPooped'],
        petIsSick = json['petIsSick'],
        timeBorn = DateTime.parse(json['timeBorn']);

  Pet.fromMemory(this.petStats, this.hasPooped, this.petIsSick);

  void refreshPet() {
    petStats.refreshStats();
    tryPoop();
    writeJsonToFile();
  }

  void eat(int foodValue) {
    petStats.changeStatByAmount(Stats.hunger, foodValue);
  }

  bool isSleeping() {
    return petStats.isSleeping;
  }

  void sleep() {
    petStats.isSleeping = true;
    petStats.startSleeping();
  }

  void wakeUp() {
    refreshPet();
    petStats.isSleeping = false;
  }

  void hadFun(int funAmount) {
    petStats.changeFunByAmount(funAmount);
  }

  isSick() {
    petIsSick = petStats.minutesSinceLastInteraction() > 5;
  }

  bool isDead() {
    return petStats.numberOfZeroStats() == 4;
  }

  giveMedicine() {
    petStats.latestInteraction = DateTime.now();
    refreshPet();
  }

  tryPoop() {
    Random rng = Random();
    if (rng.nextInt(5) == 1) {
      hasPooped = true;
    }
  }

  bathe() {
    petStats.changeStatByAmount(Stats.hygiene, 10);
    hasPooped = false;
  }

  @override
  bool operator ==(Object other) {
    return other is Pet && other.petStats == petStats &&
        other.hasPooped == hasPooped && other.petIsSick == petIsSick &&
        timeBorn.compareTo(other.timeBorn) == 0;
  }

  @override
  int get hashCode => super.hashCode;

  String _filename = "Pet";
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_filename.json');
  }

  Future<void> writeJsonToFile() async {
    print("writing");
    final file = await _localFile;
    await file.writeAsString(jsonEncode(toJson()));
  }

  Future<Pet> readData() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      print(contents);
      Map<String, dynamic> decoded = jsonDecode(contents);
      Pet fromMemory = Pet.fromJson(decoded);
      print("reading successful");
      fromMemory.petExists = true;
      return fromMemory;
    }
    catch (e) {
      print("Reading failed");
      return Pet();
    }
  }

  int ageInMinutes() {
    DateTime now = DateTime.now();
    Duration difference = now.difference(timeBorn);
    return difference.inMinutes;
  }




}