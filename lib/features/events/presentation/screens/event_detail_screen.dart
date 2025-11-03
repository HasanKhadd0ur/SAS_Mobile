import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';
import '../../domain/models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  final bool isMonitor;

  const EventDetailScreen({
    required this.event,
    this.isMonitor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final info = event.eventInfo;
    final theme = Theme.of(context);
    final dateFormat = DateFormat.yMMMMd();

    return Scaffold(
      appBar: AppBar(
        title: Text(info.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
      ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      info.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ),
                  if (isMonitor)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // TODO: Navigate to update info page
                      },
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Summary
              Text(
                info.summary.isNotEmpty
                    ? info.summary
                    : 'No summary available.',
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),

              // Metadata
              _buildMetaRow('📅', 'Created:',
                  dateFormat.format(event.createdAt.toLocal())),
              if (event.topic.name.isNotEmpty)
                _buildMetaRow('🏷️', 'Topic:', event.topic.name),
              _buildMetaRow(
                '📍',
                'Location:',
                '${event.location.regionName ?? '-'}, ${event.location.country ?? '-'} ${event.location.city ?? ''}',
              ),
              _buildMetaRow(
                '😊',
                'Sentiment:',
                '${info.sentimentLabel} (${info.sentimentScore.toStringAsFixed(2)})',
              ),
              const SizedBox(height: 12),

              // Status
              Row(
                children: [
                  const Text('ℹ️ ', style: TextStyle(fontSize: 18)),
                  const SizedBox(width: 4),
                  const Text(
                    'Status:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: event.isReviewed
                          ? Colors.green
                          : Colors.orange.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.isReviewed ? 'Reviewed' : 'Under Review',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),

              // Actions
              if (isMonitor)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (!event.isReviewed)
                      _buildActionButton(
                        context,
                        icon: Icons.check,
                        label: 'Mark as Reviewed',
                        color: Colors.green,
                        onPressed: () {
                          // TODO: Mark as reviewed
                        },
                      ),
                    _buildActionButton(
                      context,
                      icon: Icons.list,
                      label: 'Show Entities',
                      color: Colors.grey.shade700,
                      onPressed: () {
                        // TODO: Toggle entities
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.tag,
                      label: 'Change Topic',
                      color: Colors.orange,
                      onPressed: () {
                        // TODO: Edit topic
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.map,
                      label: 'Update Location',
                      color: Colors.blue,
                      onPressed: () {
                        // TODO: Update location
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.edit_note,
                      label: 'Edit Info',
                      color: Colors.indigo,
                      onPressed: () {
                        // TODO: Edit info
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.delete,
                      label: 'Delete',
                      color: Colors.red,
                      onPressed: () {
                        // TODO: Confirm delete
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.reviews,
                      label: 'Write Review',
                      color: Colors.black87,
                      onPressed: () {
                        // TODO: Open review form
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.message,
                      label: 'Show Messages',
                      color: Colors.teal,
                      onPressed: () {
                        // TODO: Toggle messages
                      },
                    ),
                    _buildActionButton(
                      context,
                      icon: Icons.star,
                      label: 'Show Reviews',
                      color: Colors.amber.shade700,
                      onPressed: () {
                        // TODO: Toggle reviews
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetaRow(String icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}
