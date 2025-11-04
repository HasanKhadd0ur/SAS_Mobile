import 'package:flutter/material.dart';
import 'package:sas_mobile/shared/constants.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<Map<String, String>> _faqs = AppConstants.FAQ;

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
      drawer: const AppDrawer(),
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
