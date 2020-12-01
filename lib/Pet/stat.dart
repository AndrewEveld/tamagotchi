import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetStats {
  Map<Stats, Stat> statsMap;
  bool isSleeping;
  DateTime latestInteraction;

  PetStats() {
    initializeAllStats();
    latestInteraction = DateTime.now();
    isSleeping = false;
  }

  PetStats.fromJson(Map<String, dynamic> json) {
    initializeAllStats();
    statsMap[Stats.hunger] = Stat.fromJson(json['Stats.hunger'], Stats.hunger);
    statsMap[Stats.energy] = Stat.fromJson(json['Stats.energy'], Stats.energy);
    statsMap[Stats.fun] = Stat.fromJson(json['Stats.fun'], Stats.fun);
    statsMap[Stats.hygiene] = Stat.fromJson(json['Stats.hygiene'], Stats.hygiene);
    isSleeping = json['isSleeping'];
    latestInteraction = DateTime.parse(json['latestInteraction']);
  }


  Map<String, dynamic> toJson() {
    return {
      'Stats.hunger' : statsMap[Stats.hunger].toJson(),
      'Stats.energy' : statsMap[Stats.energy].toJson(),
      'Stats.fun' : statsMap[Stats.fun].toJson(),
      'Stats.hygiene' : statsMap[Stats.hygiene].toJson(),
      'isSleeping' : isSleeping,
      'latestInteraction' : latestInteraction.toString(),
    };
  }


  initializeAllStats() {
    statsMap = Map();
    for (Stats stat in Stats.values) {
      statsMap.putIfAbsent(stat, () => Stat(stat));
    }
  }

  refreshStats() {
    statsMap.values.forEach(refreshStat);
  }

  refreshStat(Stat stat) {
    if (stat.stat == Stats.energy && isSleeping) {
      stat.refreshStat(true);
    }
    else stat.refreshStat(false);
  }

  updateLatestInteraction() {
    latestInteraction = DateTime.now();
  }

  changeStatByAmount(Stats stat, int amount) {
    statsMap[stat].changeStatByAmount(amount);
    updateLatestInteraction();
  }

  changeHungerByAmount(int amount) {
    changeStatByAmount(Stats.hunger, amount);
  }

  changeHygieneByAmount(int amount) {
    changeStatByAmount(Stats.hygiene, amount);
  }

  changeFunByAmount(int amount) {
    changeStatByAmount(Stats.fun, amount);
  }

  startSleeping() {
    changeStatByAmount(Stats.energy, 0);
  }

  int numberOfZeroStats() {
    return statsMap.values.where(isStatZero).length;
  }

  bool isStatZero(Stat stat) {
    return stat.value == 0;
  }

  DateTime getLastInteraction() {
    return latestInteraction;
  }

  int minutesSinceLastInteraction() {
    DateTime now = DateTime.now();
    Duration difference = now.difference(latestInteraction);
    return difference.inMinutes;
  }

  @override
  bool operator ==(Object other) {
      return other is PetStats &&
          other.latestInteraction.compareTo(latestInteraction) == 0 &&
          other.isSleeping == isSleeping && statsAreSame(other);
  }

  bool statsAreSame(PetStats other) {
    for (Stats stats in Stats.values) {
      if (other is PetStats && other.statsMap[stats] != statsMap[stats]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode => super.hashCode;

}

class Stat {
  final List<int> range = [0, 10];
  int value;
  DateTime mostRecentTimeChange;
  Stats stat;

  Stat(this.stat) {
    value = 5;
    updateTime();
  }

  Stat.fromJson(Map<String, dynamic> json, this.stat) {
    value = json['value'];
    mostRecentTimeChange = DateTime.parse(json['mostRecentTimeChange']);
  }

  Map<String, dynamic> toJson() {
    return {
      'value' : value,
      'mostRecentTimeChange' : mostRecentTimeChange.toString(),
    };
  }

  int changeStatByAmount(int amount) {
    updateTime();
    value += amount;
    if (value > 10) {
      value = 10;
    }
    return value;
  }

  updateTime() {
    mostRecentTimeChange = DateTime.now();
  }

  int roundValue() {
    value = max(range[0], value);
    value = min(range[1], value);
    return value;
  }

  refreshStat(bool isRefreshPositive) {
    int refreshSignMultiplier = isRefreshPositive ? 2 : -1;
    int changeStatBy = calculateChangeSinceUpdate();
    changeStatByAmount(changeStatBy * refreshSignMultiplier);
    updateTime();
  }

  int calculateChangeSinceUpdate() {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(mostRecentTimeChange);
    return difference.inMinutes;

  }

  @override
  bool operator ==(Object other) {
    return other is Stat && other.value == value &&
        other.mostRecentTimeChange.compareTo(mostRecentTimeChange) == 0 &&
        other.stat == stat;
  }

  @override
  int get hashCode => super.hashCode;

}

enum Stats {
  hunger,
  energy,
  hygiene,
  fun
}