import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'question': 'Why SAS?',
      'answer':
          'Social media has become a primary source of real-time information. SAS leverages this by continuously scraping and analyzing data from platforms like Telegram and Twitter to identify events as they unfold.'
    },
    {
      'question': 'What is SAS?',
      'answer':
          'SAS (Situational Awareness System) is a scalable platform that monitors, detects, and visualizes events using social media data with AI-powered crawlers.'
    },
    {
      'question': 'How does SAS detect events?',
      'answer':
          'SAS leverages deep learning models, natural language processing, and clustering techniques to identify emerging events and determine their geographic locations.'
    },
    {
      'question': 'Who can use SAS?',
      'answer':
          'SAS is designed for both the public and decision-makers. General users can explore events, while authorized monitors and analysts can update and verify event details.'
    },
    {
      'question': 'Is SAS free to use?',
      'answer':
          'Basic access to the daily event map is open for everyone. Advanced features such as historical data, analytics, and personalized alerts require an account.'
    },
  ];

  final Set<int> _expandedIndexes = {};

  void _toggle(int index) {
    setState(() {
      if (_expandedIndexes.contains(index)) {
        _expandedIndexes.remove(index);
      } else {
        _expandedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        itemCount: _faqs.length,
        itemBuilder: (context, i) {
          final faq = _faqs[i];
          final isExpanded = _expandedIndexes.contains(i);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                faq['question']!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (_) => _toggle(i),
              children: [
                Text(
                  faq['answer']!,
                  style: const TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF444444)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
