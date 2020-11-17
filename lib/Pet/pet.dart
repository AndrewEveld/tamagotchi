import 'dart:math';

import 'stat.dart';

class Pet {
  PetStats petStats;
  bool isSleeping;
  bool hasPooped;
  //Grid gridDisplay;

  Pet() {
    petStats = PetStats();
    isSleeping = false;
    hasPooped = false;
  }

  Pet.fromMemory(this.petStats, this.isSleeping, this.hasPooped);

  void refreshPet() {
    petStats.refreshStats();
    tryPoop();
  }

  void eat() {
    int statIncreaseFromEating = 5;
    petStats.changeStatByAmount(Stats.hunger, statIncreaseFromEating);
  }

  void sleep() {
    isSleeping = true;
    petStats.changeEnergyByAmount(0);
  }

  void wakeUp() {
    isSleeping = false;
    petStats.changeEnergyByAmount(0);
  }

  void hadFun() {
    petStats.changeFunByAmount(5);
  }

  void isSick() {
    //TODO What defines a sick pet?
    // Maybe length of time that the pet is ignored.
  }

  bool isDead() {
    return petStats.numberOfZeroStats() == 4;
  }

  giveMedicine() {
    //TODO Cure the sickness.
  }

  tryPoop() {
    Random rng = Random();
    if (rng.nextInt(5) == 1) {
      hasPooped = true;
    }
  }

}