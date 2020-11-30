import 'dart:math';

import 'stat.dart';

class Pet {
  PetStats petStats;
  bool hasPooped;
  bool petIsSick;

  Pet() {
    petStats = PetStats();
    hasPooped = false;
  }

  Map<String, dynamic> toJson() {
    return {
      'petStats': petStats.toJson(),
      'hasPooped': hasPooped,
      'petIsSick': petIsSick,
    };
  }

  Pet.fromJson(Map<String, dynamic> json)
      : petStats = PetStats.fromJson(json['petStats']),
        hasPooped = json['hasPooped'],
        petIsSick = json['petIsSick'];

  Pet.fromMemory(this.petStats, this.hasPooped, this.petIsSick);

  void refreshPet() {
    petStats.refreshStats();
    tryPoop();
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

  cleanPoop() {
    hasPooped = false;
  }

}