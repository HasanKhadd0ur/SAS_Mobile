import 'package:flutter/material.dart';
import '../../features/events/domain/models/event.dart';

class MapMarkerWidget extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const MapMarkerWidget({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.location_on,
        color: Colors.lightBlue,
        size: 40,
      ),
    );
  }
}
