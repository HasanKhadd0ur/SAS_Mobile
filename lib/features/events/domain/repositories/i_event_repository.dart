import '../models/event.dart';

/// Interface for the EventRepository
abstract class IEventRepository {
  
  Future<List<Event>> fetchDailyEventsPage(int pageNumber, {int pageSize = 10});
  Future<List<Event>> fetchDailyEvents();
  Future<Event> getEventById(String id);
  Future<String> getTodaySummary();
}
