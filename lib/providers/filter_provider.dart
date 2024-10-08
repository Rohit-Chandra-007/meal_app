import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> choosenFilter) {
    state = choosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMealsProvider = Provider(
  (ref) {
    final meals = ref.watch(mealsProvider);
    final activeFilter = ref.watch(filterProvider);
    return meals.where((meal) {
      if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.lactoseFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  },
);
