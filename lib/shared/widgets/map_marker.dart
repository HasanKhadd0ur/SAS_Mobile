// Simple placeholder for custom marker widget or helpers
import 'package:flutter/material.dart';

class MapMarker extends StatelessWidget {
  final String label;
  const MapMarker({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on, size: 28),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}