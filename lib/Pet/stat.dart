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
  }

  PetStats.fromJson(Map<String, dynamic> json) {
    initializeAllStats();
    statsMap[Stats.hunger] = Stat.fromJson(json['hunger'], Stats.hunger);
    statsMap[Stats.energy] = Stat.fromJson(json['energy'], Stats.energy);
    statsMap[Stats.fun] = Stat.fromJson(json['fun'], Stats.fun);
    statsMap[Stats.hygiene] = Stat.fromJson(json['hygiene'], Stats.hygiene);
    isSleeping = json['isSleeping'];
    latestInteraction = json['latestInteraction'];
  }


  Map<String, dynamic> toJson() {
    return {
      'hunger' : statsMap[Stats.hunger].toJson(),
      'energy' : statsMap[Stats.energy].toJson(),
      'fun' : statsMap[Stats.fun].toJson(),
      'hygiene' : statsMap[Stats.hygiene].toJson(),
      'isSleeping' : isSleeping,
      'latestInteraction' : latestInteraction
    };
  }


  initializeAllStats() {
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
    mostRecentTimeChange = json['mostRecentTimeChange'];
  }

  Map<String, dynamic> toJson() {
    return {
      'value' : value,
      'mostRecentTimeChange' : mostRecentTimeChange,
    };
  }

  int changeStatByAmount(int amount) {
    updateTime();
    value += amount;
    return roundValue();
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
    int refreshSignMultiplier = isRefreshPositive ? 1 : -1;
    int changeStatBy = calculateChangeSinceUpdate();
    changeStatByAmount(changeStatBy * refreshSignMultiplier);
    updateTime();
  }
  
  int calculateChangeSinceUpdate() {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(mostRecentTimeChange);
    return difference.inMinutes;
    
  }
}

enum Stats {
  hunger,
  energy,
  hygiene,
  fun
}