import 'package:flutter/material.dart';

class AssessmentIcon extends StatelessWidget {
  final String icon;

  const AssessmentIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon.isEmpty || !icon.startsWith('http')) {
      return const Icon(Icons.assignment, size: 80, color: Colors.blue);
    }
    return Image.network(
      icon,
      width: 80,
      height: 80,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.assignment, size: 80, color: Colors.blue);
      },
    );
  }
}
