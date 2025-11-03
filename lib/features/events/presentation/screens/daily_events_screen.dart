import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sas_mobile/features/events/presentation/screens/event_detail_screen.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';
import '../../../../shared/widgets/loading_spinner.dart';
import '../../domain/models/event.dart';
import '../../data/event_repository.dart';

class DailyEventsScreen extends StatefulWidget {
  final EventRepository eventRepository;
  const DailyEventsScreen({required this.eventRepository, super.key});

  @override
  State<DailyEventsScreen> createState() => _DailyEventsScreenState();
}

class _DailyEventsScreenState extends State<DailyEventsScreen> {
  final List<Event> _events = [];
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  bool _hasMore = true;
  int _pageNumber = 1;
  final int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _loadNextPage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading &&
          _hasMore) {
        _loadNextPage();
      }
    });
  }

  Future<void> _loadNextPage() async {
    setState(() => _isLoading = true);
    try {
      final newEvents = await widget.eventRepository.fetchDailyEventsPage(_pageNumber, pageSize: _pageSize);
      if (newEvents.isEmpty) {
        setState(() => _hasMore = false);
      } else {
        setState(() {
          _pageNumber++;
          _events.addAll(newEvents);
        });
      }
    } catch (e) {
      debugPrint('Error loading events: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date.toLocal());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Events')),
      drawer: const AppDrawer(),
      body: _isLoading && _events.isEmpty
          ? const LoadingSpinner()
          : _events.isEmpty
              ? const Center(
                  child: Text(
                    'No events for today.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _events.clear();
                      _pageNumber = 1;
                      _hasMore = true;
                    });
                    await _loadNextPage();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _events.length + (_hasMore ? 1 : 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      if (index == _events.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final e = _events[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EventDetailScreen(event: e),
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.bolt,
                                          color: Colors.amber, size: 24),
                                      const SizedBox(width: 8),
                                      Text(
                                        e.eventInfo.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF34495E),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: e.isReviewed
                                          ? Colors.green[600]
                                          : Colors.blue[400],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      e.isReviewed
                                          ? 'Reviewed'
                                          : 'Under Review',
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
                                e.eventInfo.summary.isNotEmpty
                                    ? e.eventInfo.summary
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 16, color: Color(0xFF2980B9)),
                                      const SizedBox(width: 6),
                                      Text(
                                        _formatDate(e.createdAt),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF95A5A6),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (e.topic != null)
                                    Row(
                                      children: [
                                        const Icon(Icons.label,
                                            size: 16,
                                            color: Color(0xFF2980B9)),
                                        const SizedBox(width: 6),
                                        Text(
                                          e.topic!.name,
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
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          EventDetailScreen(event: e),
                                    ),
                                  ),
                                  icon: const Icon(Icons.visibility,
                                      size: 18, color: Color(0xFF2980B9)),
                                  label: const Text(
                                    'View',
                                    style: TextStyle(color: Color(0xFF2980B9)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFF2980B9), width: 1.5),
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
                    },
                  ),
                ),
    );
  }
}
