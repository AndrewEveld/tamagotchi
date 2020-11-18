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
    print(jsonEncode(encoded));
    expect(value, encoded['value']);
    expect(mostRecentTimeChange, encoded['mostRecentTimeChange']);
  });

  test("Decode Stat Works" , () {
    String encodedJson = '{value: 8, mostRecentTimeChange: 1999-01-01 00:00:00.000}';
    Map<String, dynamic> decodedJson = jsonDecode(encodedJson);
    Stat decodedStat = Stat.fromJson(decodedJson, Stats.fun);
    expect(value, decodedStat.value);
    expect(mostRecentTimeChange, decodedStat.mostRecentTimeChange);
  });
}