import '../domain/models/event.dart';
import 'event_api.dart';

class EventRepository {
  final EventApi api;
  EventRepository(this.api);

  Future<List<Event>> fetchDailyEventsPage(int pageNumber, {int pageSize = 10}) async {
    final DateTime lastDay = DateTime.now().subtract(const Duration(days: 1));
    return api.getEventsUpdatedAfter(
      lastUpdate: lastDay,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }
  Future<Event> getEventById(String id) => api.getEventById(id);

}
