import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class FavouritesMealProvider extends StateNotifier<List<Meal>> {
  FavouritesMealProvider() : super([]);

  bool toggleFavouriteStatus(Meal meal) {
    final alreadyAvailable = state.contains(meal);
    if (alreadyAvailable) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouritesMealProvider, List<Meal>>(
        (ref) => FavouritesMealProvider());
