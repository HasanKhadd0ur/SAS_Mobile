import 'package:flutter/material.dart';
import '../../domain/models/event.dart';
import '../screens/event_detail_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final String formattedDate;

  const EventCard({
    required this.event,
    required this.formattedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.bolt, color: Colors.amber, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      event.eventInfo.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF34495E),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: event.isReviewed ? Colors.green[600] : Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    event.isReviewed ? 'Reviewed' : 'Under Review',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Summary
            Text(
              event.eventInfo.summary.isNotEmpty
                  ? event.eventInfo.summary
                  : 'No summary available.',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF7F8C8D),
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            // Meta
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Color(0xFF2980B9)),
                    const SizedBox(width: 6),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF95A5A6),
                      ),
                    ),
                  ],
                ),
                if (event.topic != null)
                  Row(
                    children: [
                      const Icon(Icons.label, size: 16, color: Color(0xFF2980B9)),
                      const SizedBox(width: 6),
                      Text(
                        event.topic!.name,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF95A5A6),
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 12),

            // Footer button
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)),
                ),
                icon: const Icon(Icons.visibility, size: 18, color: Color(0xFF2980B9)),
                label: const Text(
                  'View',
                  style: TextStyle(color: Color(0xFF2980B9)),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF2980B9), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
