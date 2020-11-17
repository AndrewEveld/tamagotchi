import 'dart:math';

class PetStats {
  Map<Stats, Stat> statsMap;

  PetStats() {
    initializeAllStats();
    }

  initializeAllStats() {
    for (Stats stat in Stats.values) {
      statsMap.putIfAbsent(stat, () => Stat());
    }
  }

  refreshStats() {
    statsMap.values.forEach((stat) {stat.refreshStat();});
  }

  changeStatByAmount(Stats stat, int amount) {
    statsMap[stat].changeStatByAmount(amount);
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

  changeEnergyByAmount(int amount) {
    changeStatByAmount(Stats.energy, amount);
  }

  int numberOfZeroStats() {
    return statsMap.values.where(isStatZero).length;
  }

  isStatZero(Stat stat) {
    return stat.value == 0;
  }
}

class Stat {
  final List<int> range = [0, 10];
  int value;
  DateTime _mostRecentTimeChange;

  Stat() {
    value = 5;
    updateTime();
  }

  Stat.fromMemory(this.value, this._mostRecentTimeChange);

  int changeStatByAmount(int amount) {
    updateTime();
    value += amount;
    return roundValue();
  }

  void updateTime() {
    _mostRecentTimeChange = DateTime.now();
  }

  int roundValue() {
    value = max(range[0], value);
    value = min(range[1], value);
    return value;
  }

  void refreshStat() {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(_mostRecentTimeChange);
    int decreaseStatBy = difference.inMinutes;
    changeStatByAmount(-decreaseStatBy);
  }
}

enum Stats {
  hunger,
  energy,
  hygiene,
  fun
}