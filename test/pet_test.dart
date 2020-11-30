import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi/Pet/stat.dart';

main() {
  DateTime mostRecentTimeChange = DateTime(1999);
  int value = 8;

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
    expect(value, decoded.value);
    expect(mostRecentTimeChange, decoded.mostRecentTimeChange);
  });


  test("Encode PetStats Works", () {
    PetStats petStats = PetStats();
    Map<String, dynamic> encoded = petStats.toJson();
    for (Stats stats in Stats.values) {
      Stat expected = petStats.statsMap[stats];
      Stat encodedStat = Stat.fromJson(encoded[stats.toString()], stats);
      expect(expected.mostRecentTimeChange, encodedStat.mostRecentTimeChange);
      expect(expected.value, encodedStat.value);
      expect(expected.stat, encodedStat.stat);
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
    for (Stats stats in Stats.values) {
      Stat expected = petStats.statsMap[stats];
      Stat decodedStat = decodedPetStats.statsMap[stats];
      expect(expected.mostRecentTimeChange, decodedStat.mostRecentTimeChange);
      expect(expected.stat, decodedStat.stat);
      expect(expected.value, decodedStat.value);
    }
    expect(petStats.isSleeping, decodedPetStats.isSleeping);
    expect(petStats.latestInteraction, decodedPetStats.latestInteraction);
  });
}