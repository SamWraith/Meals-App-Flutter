import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final isMealFavourite = state.contains(meal);
    if (isMealFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [
        ...state,
        meal
      ]; // ... list ke saare elements ko bahar le aata hai toh yaha pe state ke element bahar aa jayege plus usmein meal add kar denge taaki immutable way mein data change ho.
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
