import 'dart:developer';
import '../../../core/network/dio_client.dart';
import '../domain/models/event.dart';

class EventApi {
  final DioClient client;
  EventApi(this.client);

  Future<List<Event>> getEventsUpdatedAfter({
    required DateTime lastUpdate,
    required int pageNumber,
    required int pageSize,
  }) async {
    final formattedTime = lastUpdate.toUtc().toIso8601String();

    try {
      log('[EventApi] Fetching events updated after: $formattedTime');
      log('[EventApi] Page: $pageNumber | Size: $pageSize');

      final response = await client.dio.get(
        '/events/updated-after',
        queryParameters: {
          'lastUpdated': formattedTime,
          'pageNumber': pageNumber,
          'pageSize': pageSize,
        },
      );

      log('[EventApi] Response type: ${response.data.runtimeType}');
      final data = response.data;

      if (data is List) {
        return data
            .map((e) => Event.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (data is Map && data.containsKey('items')) {

        final items = data['items'] as List<dynamic>;
        return items
            .map((e) => Event.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        log('[EventApi] Unexpected data format: $data');
        return [];
      }
    } catch (e, stack) {
      log('[EventApi] Error fetching events: $e');
      log('[EventApi] Stack trace:\n$stack');
      rethrow;
    }
  }

  Future<Event> getEventById(String id) async {
    try {
      final response = await client.dio.get('/events/$id');
      return Event.fromJson(response.data as Map<String, dynamic>);
    } catch (e, stack) {
      log('[EventApi] Error fetching event by id: $e');
      log('[EventApi] Stack trace:\n$stack');
      rethrow;
    }
  }
}
