import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi/Pet/pet.dart';
import 'package:tamagotchi/Pet/stat.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  DateTime mostRecentTimeChange = DateTime(1999);
  int value = 8;

  test("Stat == operator should work", () {
    Stat original = Stat(Stats.hunger);
    Stat sameAsOriginal = Stat(Stats.hunger);
    Stat differentThanOriginal = Stat(Stats.energy);
    sameAsOriginal.mostRecentTimeChange = original.mostRecentTimeChange;
    expect(original, sameAsOriginal);
    expect(original, isNot(equals(differentThanOriginal)));
  });

  test("PetStats == operator should work", () {
    PetStats original = PetStats();
    PetStats same = PetStats();
    PetStats different = PetStats();
    same.statsMap = original.statsMap;
    same.latestInteraction = original.latestInteraction;
    expect(original, same);
    expect(original, isNot(equals(different)));
  });

  test("Pet == operator should work", () {
    Pet original = Pet();
    Pet same = Pet();
    Pet different = Pet();
    same.petStats = original.petStats;
    same.timeBorn = original.timeBorn;
    expect(original, same);
    expect(original, isNot(equals(different)));
  });

  test("Encode Stat Works", () {
    Stat toEncode = Stat(Stats.hunger);
    toEncode.value = value;
    toEncode.mostRecentTimeChange = mostRecentTimeChange;
    Map<String, dynamic> encoded = toEncode.toJson();
    expect(value, encoded['value']);
    expect(mostRecentTimeChange, DateTime.parse(encoded['mostRecentTimeChange']));
  });

  test("Decode Stat Works" , () {
    String encodedJson = '{"value": 8, "mostRecentTimeChange": "1999-01-01 00:00:00.000"}';
    Map<String, dynamic> decodedJson = jsonDecode(encodedJson);
    Stat decodedStat = Stat.fromJson(decodedJson, Stats.fun);
    expect(value, decodedStat.value);
    expect(mostRecentTimeChange, decodedStat.mostRecentTimeChange);
  });

  test("Encode to decode Stat Works", () {
    Stat toEncode = Stat(Stats.hunger);
    toEncode.value = value;
    toEncode.mostRecentTimeChange = mostRecentTimeChange;
    String jsonEncoded = jsonEncode(toEncode.toJson());
    Map<String, dynamic> jsonDecoded = jsonDecode(jsonEncoded);
    Stat decoded = Stat.fromJson(jsonDecoded, Stats.hunger);
    expect(toEncode, decoded);
  });


  test("Encode PetStats Works", () {
    PetStats petStats = PetStats();
    Map<String, dynamic> encoded = petStats.toJson();
    for (Stats stats in Stats.values) {
      Stat expected = petStats.statsMap[stats];
      Stat encodedStat = Stat.fromJson(encoded[stats.toString()], stats);
      expect(expected, encodedStat);
    }
    expect(petStats.isSleeping, encoded['isSleeping']);
    expect(petStats.latestInteraction, DateTime.parse(encoded['latestInteraction']));
  });

  test("Encode to Decode PetStats Works", () {
    PetStats petStats = PetStats();
    Map<String, dynamic> encoded = petStats.toJson();
    String jsonEncoded = jsonEncode(encoded);
    Map<String, dynamic> decoded = jsonDecode(jsonEncoded);
    PetStats decodedPetStats = PetStats.fromJson(decoded);
    expect(petStats, decodedPetStats);
  });

  test("Encode Pet works", () {
    Pet toEncode = Pet();
    Map<String, dynamic> encoded = toEncode.toJson();
    expect(toEncode.petStats, PetStats.fromJson(encoded['petStats']));
    expect(toEncode.hasPooped, encoded['hasPooped']);
    expect(toEncode.petIsSick, encoded['petIsSick']);
  });

  test("Encode to json String and decoding from json string should work", () {
    Pet toEncode = Pet();
    Map<String, dynamic> encoded = toEncode.toJson();
    String encodedString = jsonEncode(encoded);
    Map<String, dynamic> decoded = jsonDecode(encodedString);
    Pet decodedPet = Pet.fromJson(decoded);
    expect(toEncode, decodedPet);
  });

  test("changStatByAmount Should Work", () {
    Stat stat = Stat(Stats.hunger);
    int expectedValue = stat.value + 2;
    stat.changeStatByAmount(2);
    expect(expectedValue, stat.value);
  });

  test("Writing and reading json files work", () async {
    Pet petToWrite = Pet();
    await petToWrite.writeJsonToFile();
    Pet petToRead = await petToWrite.readData();
    expect(petToWrite, petToRead);
  });

  setUpAll(() async {
    final directory = await Directory.systemTemp.createTemp();
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });

}