class Challenge {
  final String cuisine;
  final DishName dishName;
  // unit?, steps: images, instructions, etc..

  const Challenge({
    required this.cuisine,
    required this.dishName,
    // ...
  });
}

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
