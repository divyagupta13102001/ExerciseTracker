import 'package:flutter/material.dart';

class routine {
  final String id;
  final String title;
  final Color color;

  const routine({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
