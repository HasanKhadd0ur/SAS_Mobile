import 'package:flutter/material.dart';
import '../../domain/models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final info = event.eventInfo;
    return Scaffold(
      appBar: AppBar(title: Text(info.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(info.summary, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text('Sentiment: ${info.sentimentLabel} (${info.sentimentScore.toStringAsFixed(2)})'),
            const SizedBox(height: 10),
            Text('Topic: ${event.topic.name}'),
            const SizedBox(height: 10),
            Text('Location: ${event.location.latitude}, ${event.location.longitude}'),
          ],
        ),
      ),
    );
  }
}
