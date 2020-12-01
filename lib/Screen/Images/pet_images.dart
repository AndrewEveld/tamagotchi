import 'package:flutter/material.dart';
import 'package:tamagotchi/Pet/stat.dart';
import 'dart:ui';
import 'package:tamagotchi/Screen/screen_colors.dart';
import 'package:tamagotchi/Screen/coordinate.dart';


List<List<Coordinate>> eggCoords =[
  [Coordinate(33,30), Coordinate(34,30), Coordinate(35,30), Coordinate(36,30), Coordinate(37,30), Coordinate(38,30), Coordinate(39,30), Coordinate(40,30), Coordinate(41,30),
  Coordinate(30,31), Coordinate(31,31), Coordinate(32,31), Coordinate(42,31), Coordinate(43,31), Coordinate(44,31),
  Coordinate(28,32), Coordinate(29,32), Coordinate(45,32), Coordinate(46,32),
  Coordinate(27,33), Coordinate(47,33),
  Coordinate(26,34), Coordinate(48,34),
  Coordinate(25,35), Coordinate(49,35),
  Coordinate(25,36), Coordinate(49,36),
  Coordinate(24,37), Coordinate(50,37),
  Coordinate(24,38), Coordinate(50,38),
  Coordinate(23,39), Coordinate(51,39),
  Coordinate(23,40), Coordinate(51,40),
  Coordinate(23,41), Coordinate(51,41),
  Coordinate(22,42), Coordinate(52,42),
  Coordinate(22,43), Coordinate(52,43),
  Coordinate(22,44), Coordinate(52,44),
  Coordinate(22,45), Coordinate(52,45),
  Coordinate(22,46), Coordinate(52,46),
  Coordinate(22,47), Coordinate(52,47),
  Coordinate(22,48), Coordinate(52,48),
  Coordinate(23,49), Coordinate(51,49),
  Coordinate(23,50), Coordinate(51,50),
  Coordinate(23,51), Coordinate(51,51),
  Coordinate(23,52), Coordinate(51,52),
  Coordinate(23,53), Coordinate(51,53),
  Coordinate(24,54), Coordinate(50,54),
  Coordinate(24,55), Coordinate(50,55),
  Coordinate(24,56), Coordinate(50,56),
  Coordinate(24,57), Coordinate(50,57),
  Coordinate(24,58), Coordinate(50,58),
  Coordinate(25,59), Coordinate(49,59),
  Coordinate(25,60), Coordinate(49,60),
  Coordinate(25,61), Coordinate(49,61),
  Coordinate(26,62), Coordinate(48,62),
  Coordinate(26,63), Coordinate(48,63),
  Coordinate(26,64), Coordinate(48,64),
  Coordinate(27,65), Coordinate(47,65),
  Coordinate(27,66), Coordinate(47,66),
  Coordinate(28,67), Coordinate(46,67),
  Coordinate(28,68), Coordinate(46,68),
  Coordinate(29,69), Coordinate(45,69),
  Coordinate(30,70), Coordinate(44,70),
  Coordinate(31,71), Coordinate(43,71),
  Coordinate(32,72), Coordinate(42,72),
  Coordinate(33,73), Coordinate(34,73), Coordinate(40,73), Coordinate(41,73),
  Coordinate(35,74), Coordinate(36,74), Coordinate(37,74), Coordinate(38,74), Coordinate(39,74)],

  [Coordinate(38,73), Coordinate(37,72), Coordinate(36,71), Coordinate(35,70)],

  [Coordinate(36,69), Coordinate(37,68), Coordinate(38,67), Coordinate(39,66)],

  [Coordinate(38,65), Coordinate(37,64), Coordinate(36,63), Coordinate(35,62), Coordinate(38,63), Coordinate(39,62), Coordinate(40,61), Coordinate(41,60)]

];

List<Color> eggColors = [color["dark"], color["medium"], color["medium"], color["medium"]];

List<Coordinate> petCoords = [
  Coordinate(38,64),
  Coordinate(37,63),
  Coordinate(34,62), Coordinate(35,62), Coordinate(36,62), Coordinate(37,62), Coordinate(38,62), Coordinate(39,62), Coordinate(40,62),
  Coordinate(32,61), Coordinate(33,61), Coordinate(34,61), Coordinate(35,61), Coordinate(36,61), Coordinate(37,61), Coordinate(38,61), Coordinate(39,61), Coordinate(40,61), Coordinate(41,61), Coordinate(42,61),
  Coordinate(31,60), Coordinate(32,60), Coordinate(33,60), Coordinate(34,60), Coordinate(35,60), Coordinate(36,60), Coordinate(37,60), Coordinate(38,60), Coordinate(39,60), Coordinate(40,60), Coordinate(41,60), Coordinate(42,60), Coordinate(43,60),
  Coordinate(30,59), Coordinate(31,59), Coordinate(32,59), Coordinate(33,59), Coordinate(34,59), Coordinate(35,59), Coordinate(36,59), Coordinate(37,59), Coordinate(38,59), Coordinate(39,59), Coordinate(40,59), Coordinate(41,59), Coordinate(42,59), Coordinate(43,59), Coordinate(44,59),
  Coordinate(29,58), Coordinate(30,58), Coordinate(31,58), Coordinate(32,58), Coordinate(33,58), Coordinate(34,58), Coordinate(35,58), Coordinate(36,58), Coordinate(37,58), Coordinate(38,58), Coordinate(39,58), Coordinate(40,58), Coordinate(41,58), Coordinate(42,58), Coordinate(43,58), Coordinate(44,58), Coordinate(45,58),
  Coordinate(29,57), Coordinate(30,57), Coordinate(31,57), Coordinate(32,57), Coordinate(33,57), Coordinate(34,57), Coordinate(35,57), Coordinate(36,57), Coordinate(37,57), Coordinate(38,57), Coordinate(39,57), Coordinate(40,57), Coordinate(41,57), Coordinate(42,57), Coordinate(43,57), Coordinate(44,57), Coordinate(45,57),
  Coordinate(28,56), Coordinate(29,56), Coordinate(30,56), Coordinate(31,56), Coordinate(32,56), Coordinate(33,56), Coordinate(34,56), Coordinate(35,56), Coordinate(36,56), Coordinate(37,56), Coordinate(38,56), Coordinate(39,56), Coordinate(40,56), Coordinate(41,56), Coordinate(42,56), Coordinate(43,56), Coordinate(44,56), Coordinate(45,56), Coordinate(46,56),
  Coordinate(28,55), Coordinate(29,55), Coordinate(30,55), Coordinate(31,55), Coordinate(32,55), Coordinate(33,55), Coordinate(34,55), Coordinate(35,55), Coordinate(36,55), Coordinate(37,55), Coordinate(38,55), Coordinate(39,55), Coordinate(40,55), Coordinate(41,55), Coordinate(42,55), Coordinate(43,55), Coordinate(44,55), Coordinate(45,55), Coordinate(46,55),
  Coordinate(28,54), Coordinate(29,54), Coordinate(30,54), Coordinate(31,54), Coordinate(32,54), Coordinate(33,54), Coordinate(34,54), Coordinate(35,54), Coordinate(36,54), Coordinate(37,54), Coordinate(38,54), Coordinate(39,54), Coordinate(40,54), Coordinate(41,54), Coordinate(42,54), Coordinate(43,54), Coordinate(44,54), Coordinate(45,54), Coordinate(46,54),
  Coordinate(27,53), Coordinate(28,53), Coordinate(29,53), Coordinate(30,53), Coordinate(31,53), Coordinate(32,53), Coordinate(33,53), Coordinate(34,53), Coordinate(35,53), Coordinate(36,53), Coordinate(37,53), Coordinate(38,53), Coordinate(39,53), Coordinate(40,53), Coordinate(41,53), Coordinate(42,53), Coordinate(43,53), Coordinate(44,53), Coordinate(45,53), Coordinate(46,53), Coordinate(47,53),
  Coordinate(27,52), Coordinate(28,52), Coordinate(29,52), Coordinate(30,52), Coordinate(31,52), Coordinate(32,52), Coordinate(33,52), Coordinate(34,52), Coordinate(35,52), Coordinate(36,52), Coordinate(37,52), Coordinate(38,52), Coordinate(39,52), Coordinate(40,52), Coordinate(41,52), Coordinate(42,52), Coordinate(43,52), Coordinate(44,52), Coordinate(45,52), Coordinate(46,52), Coordinate(47,52),
  Coordinate(27,51), Coordinate(28,51), Coordinate(29,51), Coordinate(30,51), Coordinate(31,51), Coordinate(32,51), Coordinate(33,51), Coordinate(34,51), Coordinate(35,51), Coordinate(36,51), Coordinate(37,51), Coordinate(38,51), Coordinate(39,51), Coordinate(40,51), Coordinate(41,51), Coordinate(42,51), Coordinate(43,51), Coordinate(44,51), Coordinate(45,51), Coordinate(46,51), Coordinate(47,51),
  Coordinate(27,50), Coordinate(28,50), Coordinate(29,50), Coordinate(30,50), Coordinate(31,50), Coordinate(32,50), Coordinate(33,50), Coordinate(34,50), Coordinate(35,50), Coordinate(36,50), Coordinate(37,50), Coordinate(38,50), Coordinate(39,50), Coordinate(40,50), Coordinate(41,50), Coordinate(42,50), Coordinate(43,50), Coordinate(44,50), Coordinate(45,50), Coordinate(46,50), Coordinate(47,50),
  Coordinate(28,49), Coordinate(29,49), Coordinate(30,49), Coordinate(31,49), Coordinate(32,49), Coordinate(33,49), Coordinate(34,49), Coordinate(35,49), Coordinate(36,49), Coordinate(37,49), Coordinate(38,49), Coordinate(39,49), Coordinate(40,49), Coordinate(41,49), Coordinate(42,49), Coordinate(43,49), Coordinate(44,49), Coordinate(45,49), Coordinate(46,49),
  Coordinate(28,48), Coordinate(29,48), Coordinate(30,48), Coordinate(31,48), Coordinate(32,48), Coordinate(33,48), Coordinate(34,48), Coordinate(35,48), Coordinate(36,48), Coordinate(37,48), Coordinate(38,48), Coordinate(39,48), Coordinate(40,48), Coordinate(41,48), Coordinate(42,48), Coordinate(43,48), Coordinate(44,48), Coordinate(45,48), Coordinate(46,48),
  Coordinate(29,47), Coordinate(30,47), Coordinate(31,47), Coordinate(32,47), Coordinate(33,47), Coordinate(34,47), Coordinate(35,47), Coordinate(36,47), Coordinate(37,47), Coordinate(38,47), Coordinate(39,47), Coordinate(40,47), Coordinate(41,47), Coordinate(42,47), Coordinate(43,47), Coordinate(44,47), Coordinate(45,47),
  Coordinate(30,46), Coordinate(31,46), Coordinate(32,46), Coordinate(33,46), Coordinate(34,46), Coordinate(35,46), Coordinate(36,46), Coordinate(37,46), Coordinate(38,46), Coordinate(39,46), Coordinate(40,46), Coordinate(41,46), Coordinate(42,46), Coordinate(43,46), Coordinate(44,46),
  Coordinate(31,45), Coordinate(32,45), Coordinate(33,45), Coordinate(34,45), Coordinate(35,45), Coordinate(36,45), Coordinate(37,45), Coordinate(38,45), Coordinate(39,45), Coordinate(40,45), Coordinate(41,45), Coordinate(42,45), Coordinate(43,45),
  Coordinate(33,44), Coordinate(34,44), Coordinate(35,44), Coordinate(36,44), Coordinate(37,44), Coordinate(38,44), Coordinate(39,44), Coordinate(40,44), Coordinate(41,44),
  Coordinate(32,43), Coordinate(33,43), Coordinate(34,43), Coordinate(35,43), Coordinate(36,43), Coordinate(37,43), Coordinate(38,43), Coordinate(39,43), Coordinate(40,43), Coordinate(41,43), Coordinate(42,43),
  Coordinate(31,42), Coordinate(32,42), Coordinate(33,42), Coordinate(34,42), Coordinate(35,42), Coordinate(36,42), Coordinate(37,42), Coordinate(38,42), Coordinate(39,42), Coordinate(40,42), Coordinate(41,42), Coordinate(42,42), Coordinate(43,42),
  Coordinate(30,41), Coordinate(31,41), Coordinate(32,41), Coordinate(33,41), Coordinate(34,41), Coordinate(35,41), Coordinate(36,41), Coordinate(37,41), Coordinate(38,41), Coordinate(39,41), Coordinate(40,41), Coordinate(41,41), Coordinate(42,41), Coordinate(43,41), Coordinate(44,41),
  Coordinate(30,40), Coordinate(31,40), Coordinate(32,40), Coordinate(33,40), Coordinate(34,40), Coordinate(35,40), Coordinate(36,40), Coordinate(37,40), Coordinate(38,40), Coordinate(39,40), Coordinate(40,40), Coordinate(41,40), Coordinate(42,40), Coordinate(43,40), Coordinate(44,40),
  Coordinate(29,39), Coordinate(30,39), Coordinate(31,39), Coordinate(32,39), Coordinate(33,39), Coordinate(34,39), Coordinate(35,39), Coordinate(36,39), Coordinate(37,39), Coordinate(38,39), Coordinate(39,39), Coordinate(40,39), Coordinate(41,39), Coordinate(42,39), Coordinate(43,39), Coordinate(44,39), Coordinate(45,39),
  Coordinate(29,38), Coordinate(30,38), Coordinate(31,38), Coordinate(32,38), Coordinate(33,38), Coordinate(34,38), Coordinate(35,38), Coordinate(36,38), Coordinate(37,38), Coordinate(38,38), Coordinate(39,38), Coordinate(40,38), Coordinate(41,38), Coordinate(42,38), Coordinate(43,38), Coordinate(44,38), Coordinate(45,38),
  Coordinate(29,37), Coordinate(30,37), Coordinate(31,37), Coordinate(32,37), Coordinate(33,37), Coordinate(34,37), Coordinate(35,37), Coordinate(36,37), Coordinate(37,37), Coordinate(38,37), Coordinate(39,37), Coordinate(40,37), Coordinate(41,37), Coordinate(42,37), Coordinate(43,37), Coordinate(44,37), Coordinate(45,37),
  Coordinate(29,36), Coordinate(30,36), Coordinate(31,36), Coordinate(32,36), Coordinate(33,36), Coordinate(34,36), Coordinate(35,36), Coordinate(36,36), Coordinate(37,36), Coordinate(38,36), Coordinate(39,36), Coordinate(40,36), Coordinate(41,36), Coordinate(42,36), Coordinate(43,36), Coordinate(44,36), Coordinate(45,36),
  Coordinate(30,35), Coordinate(31,35), Coordinate(32,35), Coordinate(33,35), Coordinate(34,35), Coordinate(35,35), Coordinate(36,35), Coordinate(37,35), Coordinate(38,35), Coordinate(39,35), Coordinate(40,35), Coordinate(41,35), Coordinate(42,35), Coordinate(43,35), Coordinate(44,35),
  Coordinate(31,34), Coordinate(32,34), Coordinate(33,34), Coordinate(34,34), Coordinate(35,34), Coordinate(36,34), Coordinate(37,34), Coordinate(38,34), Coordinate(39,34), Coordinate(40,34), Coordinate(41,34), Coordinate(42,34), Coordinate(43,34),
  Coordinate(32,33), Coordinate(33,33), Coordinate(34,33), Coordinate(35,33), Coordinate(36,33), Coordinate(37,33), Coordinate(38,33), Coordinate(39,33), Coordinate(40,33), Coordinate(41,33), Coordinate(42,33),
  Coordinate(34,32), Coordinate(40,32),
  Coordinate(33,31), Coordinate(34,31), Coordinate(35,31), Coordinate(39,31), Coordinate(40,31), Coordinate(41,31),
  Coordinate(34,30), Coordinate(40,30)
];

List<Color> petAwakeColors = [
  color["dark"],
  color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["medium"], color["medium"], color["medium"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["dark"], color["dark"], color["dark"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["medium"], color["medium"],
  color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"],
  color["medium"], color["medium"]
];

List<Color> petAsleepColors = [
  color["dark"],
  color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"], color["medium"], color["medium"], color["medium"], color["dark"], color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["dark"], color["dark"], color["dark"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["medium"], color["medium"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["medium"], color["medium"], color["dark"],
  color["dark"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["light"], color["dark"],
  color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
  color["medium"], color["medium"],
  color["medium"], color["medium"], color["medium"], color["medium"], color["medium"], color["medium"],
  color["medium"], color["medium"]
];

List<List<Coordinate>> heartCoords = [
  [Coordinate(3,3), Coordinate(4,3), Coordinate(6,3), Coordinate(7,3),
    Coordinate(3,2), Coordinate(4,2), Coordinate(5,2), Coordinate(6,2), Coordinate(7,2),
    Coordinate(4,1), Coordinate(5,1), Coordinate(6,1),
    Coordinate(5,0)],

  [Coordinate(2,8), Coordinate(3,8), Coordinate(7,8), Coordinate(8,8),
    Coordinate(1,7), Coordinate(2,7), Coordinate(3,7), Coordinate(4,7), Coordinate(6,7), Coordinate(7,7), Coordinate(8,7), Coordinate(9,7),
    Coordinate(0,6), Coordinate(1,6), Coordinate(2,6), Coordinate(3,6), Coordinate(4,6), Coordinate(5,6), Coordinate(6,6), Coordinate(7,6), Coordinate(8,6), Coordinate(9,6), Coordinate(10,6),
    Coordinate(0,5), Coordinate(1,5), Coordinate(2,5), Coordinate(3,5), Coordinate(4,5), Coordinate(5,5), Coordinate(6,5), Coordinate(7,5), Coordinate(8,5), Coordinate(9,5), Coordinate(10,5),
    Coordinate(1,4), Coordinate(2,4), Coordinate(3,4), Coordinate(4,4), Coordinate(5,4), Coordinate(6,4), Coordinate(7,4), Coordinate(8,4), Coordinate(9,4),
    Coordinate(2,3), Coordinate(3,3), Coordinate(4,3), Coordinate(5,3), Coordinate(6,3), Coordinate(7,3), Coordinate(8,3),
    Coordinate(3,2), Coordinate(4,2), Coordinate(5,2), Coordinate(6,2), Coordinate(7,2),
    Coordinate(4,1), Coordinate(5,1), Coordinate(6,1),
    Coordinate(5,0)]
];

List<List<Color>>heartColors = [
  [color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"],
    color["dark"]],

  [color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["light"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"], color["dark"], color["dark"],
    color["dark"], color["dark"], color["dark"],
    color["dark"]]
];

Map<Stats, int> statXOffset = {
  Stats.hunger : 5,
  Stats.hygiene : 40,
  Stats.energy : 5,
  Stats.fun : 40
};

Map<Stats, int> statYOffset = {
  Stats.hunger : 112,
  Stats.hygiene : 112,
  Stats.energy : 103,
  Stats.fun : 103
};

Map<Stats, String> statString = {
  Stats.hunger : "hunger",
  Stats.hygiene : "hygiene",
  Stats.energy : "energy",
  Stats.fun : "fun"
};

List<Coordinate> statBarCoords = [
  Coordinate(0,1), Coordinate(1,1), Coordinate(2,1), Coordinate(3,1), Coordinate(4,1), Coordinate(5,1), Coordinate(6,1), Coordinate(7,1), Coordinate(8,1), Coordinate(9,1),
  Coordinate(0,0), Coordinate(1,0), Coordinate(2,0), Coordinate(3,0), Coordinate(4,0), Coordinate(5,0), Coordinate(6,0), Coordinate(7,0), Coordinate(8,0), Coordinate(9,0)
];