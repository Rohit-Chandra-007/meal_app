import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';

class IngredientWidget extends StatelessWidget {
  final Meal meal;

  const IngredientWidget({super.key, required this.meal});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Important for SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(),
      //padding: EdgeInsets.zero,
      itemCount: meal.ingredients.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisExtent: 45,
      ),

      itemBuilder: (context, index) {
        return Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•', // Bullet character
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(width: 6), // Space between bullet and text
            Expanded(
              child: Text(
                meal.ingredients[index],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
