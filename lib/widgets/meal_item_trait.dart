import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData iconData;
  final String label;
  const MealItemTrait({super.key, required this.label, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
