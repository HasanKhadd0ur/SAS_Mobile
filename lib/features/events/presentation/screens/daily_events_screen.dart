import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sas_mobile/features/events/presentation/screens/event_detail_screen.dart';
import 'package:sas_mobile/features/events/presentation/widgets/empty_events.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';
import '../../../../shared/widgets/loading_spinner.dart';
import '../../domain/models/event.dart';
import '../../data/event_repository.dart';
import '../widgets/event_card.dart';

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

  String _formatDate(DateTime date) => DateFormat.yMMMd().format(date.toLocal());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Events')),
      drawer: const AppDrawer(),
      body: _isLoading && _events.isEmpty
          ? const LoadingSpinner()
          : _events.isEmpty
              ? const EmptyEventsWidget()
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      if (index == _events.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final e = _events[index];
                      return EventCard(event: e, formattedDate: _formatDate(e.createdAt));
                    },
                  ),
                ),
    );
  }
}
