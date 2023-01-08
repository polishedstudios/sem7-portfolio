import 'package:flutter/material.dart';

class DishName {
  final String name;
  final String? original;
  final String? originalPronounciation;

  const DishName({
    required this.name,
    this.original,
    this.originalPronounciation,
  });
}

class DishStep {
  final String type;
  final String title;
  final String instruction;
  // video/image (outside scope)
  // (optional presentations)

  const DishStep({
    required this.type,
    required this.title,
    required this.instruction,
  });
}

class Challenge {
  final DishName dishName;
  final Image image;
  final int difficulty;
  final Duration duration;
  final List<Challenge>?
      upgradeChallenges; // if the challenge has "upgrade" options
  final Image ingredientsImage;
  final List<String> ingredients;
  final List<DishStep> steps;

  const Challenge({
    required this.dishName,
    required this.image,
    required this.difficulty,
    required this.duration,
    this.upgradeChallenges,
    required this.ingredientsImage,
    required this.ingredients,
    required this.steps,
  });
}
