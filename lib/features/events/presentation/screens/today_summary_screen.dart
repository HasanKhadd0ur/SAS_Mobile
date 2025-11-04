import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../data/event_repository.dart';

class TodaySummaryScreen extends StatefulWidget {
  final EventRepository eventRepository;

  const TodaySummaryScreen({super.key, required this.eventRepository});

  @override
  State<TodaySummaryScreen> createState() => _TodaySummaryScreenState();
}

class _TodaySummaryScreenState extends State<TodaySummaryScreen> {
  late Future<String> _summaryFuture;

  @override
  void initState() {
    super.initState();
    _summaryFuture = _loadSummary();
  }

  Future<String> _loadSummary() async {
    // The repository should have a method like getTodaySummary()
    // which calls the /events/summary/today endpoint
    return await widget.eventRepository.getTodaySummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today Summary')),
      body: FutureBuilder<String>(
        future: _summaryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                '⚠️ Failed to load summary.',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            );
          }

          final data = snapshot.data ?? '';

          if (data.isEmpty) {
            return const Center(
              child: Text(
                'No summary available for today.',
                style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            );
          }

          return Markdown(
            data: data,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              textAlign: WrapAlignment.end,
              p: const TextStyle(fontSize: 16, height: 1.5),
              h2: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
