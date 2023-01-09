import 'package:flutter/material.dart';
import 'challenge.dart';

const challenges = [
  Challenge(
    dishName: DishName(
      name: 'Curry Rice',
      original: 'カレーライス',
      originalPronunciation: 'Karēraisu',
    ),
    image: Image(image: AssetImage('assets/challenges/CurryRice.png')),
    difficulty: 2,
    duration: Duration(minutes: 30),
    ingredientsImage:
        Image(image: AssetImage('assets/challenges/CurryRice_Ingredients.png')),
    ingredients: [
      "400g onion",
      "250g potato",
      "100g carrot",
      "1tbsp oil",
      "100g curry blocks or curry mix",
      "800ml water",
      "4 cups of rice",
    ],
    steps: [
      DishStep(
          type: "prep",
          title: "Prepare ingredients",
          instruction: "Cut all ingredients into cubes of 2cm."),
      DishStep(
          type: "cook",
          title: "Cook rice and set aside",
          instruction: "Cook the rice and set aside. While cooking, continue."),
      DishStep(
          type: "cook",
          title: "Sauté onion pieces",
          instruction: "Sauté onion pieces until the edges start browning."),
      DishStep(
          type: "cook",
          title: "Add potato and carrot pieces",
          instruction: "Add potato and carrot pieces to the pot and stir."),
      DishStep(
          type: "cook",
          title: "Add water and bring it to a boil",
          instruction: "Add water to the pot and cook until it boils."),
      DishStep(
          type: "cook",
          title: "Add curry roux and cook",
          instruction: "Add the curry roux and cook 5 minutes."),
      DishStep(
          type: "presentation",
          title: "Present your dish",
          instruction:
              "Divide half of the plate with rice and the other half with curry."),
    ],
  ),
];
