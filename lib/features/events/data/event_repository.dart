import '../domain/models/event.dart';
import 'event_api.dart';

class EventRepository {
  final EventApi api;
  EventRepository(this.api);

  Future<List<Event>> fetchDailyEventsPage(int pageNumber, {int pageSize = 10}) async {
    final DateTime lastDay = DateTime.now().subtract(const Duration(days: 3));
    final events = await api.getEventsUpdatedAfter( 
      lastUpdate: lastDay,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
    return events;
  }

  Future<List<Event>> fetchDailyEvents() async {
    final DateTime lastDay = DateTime.now().subtract(const Duration(days: 3));
    final events = await api.getEventsUpdatedAfter(lastUpdate: lastDay    );
    return events;
  }

  Future<Event> getEventById(String id) => api.getEventById(id);

}
