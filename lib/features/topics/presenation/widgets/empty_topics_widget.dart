import 'package:flutter/material.dart';

class EmptyTopicsWidget extends StatelessWidget {
  const EmptyTopicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_topics.png',
            height: 160,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'No topics available yet.',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
