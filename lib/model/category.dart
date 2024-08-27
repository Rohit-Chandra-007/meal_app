import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange, // default data Color value
  });

  final String id;
  final String title;
  final Color color;
}
