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
      print('🔍 [EventApi] Fetching events updated after: $formattedTime');
      print('📄 [EventApi] Page: $pageNumber | Size: $pageSize');
      print('🌐 [EventApi] URL: /events/updated-after');

      final response = await client.dio.get(
        '/events/updated-after',
        queryParameters: {
          'lastUpdated': formattedTime,
          'pageNumber': pageNumber,
          'pageSize': pageSize,
        },
      );

      print('✅ [EventApi] Response received: ${response.statusCode}');
      print('📦 [EventApi] Raw data type: ${response.data.runtimeType}');

      if (response.statusCode != 200) {
        print('⚠️ [EventApi] Unexpected status: ${response.statusCode}');
      }

      final data = response.data;
      if (data is! List) {
        print('❌ [EventApi] Unexpected response format: $data');
        throw Exception('Expected a List but got ${data.runtimeType}');
      }

      final events = data.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
      print('✅ [EventApi] Parsed ${events.length} events');
      return events;
    } on Exception catch (e, stack) {
      print('❌ [EventApi] Error loading events: $e');
      log('Stack trace:\n$stack');
      log('Stack trace:\n$e');
      
      rethrow;
    }
  }

  Future<Event> getEventById(String id) async {
    try {
      print('🔍 [EventApi] Fetching event by ID: $id');
      final response = await client.dio.get('/events/$id');
      print('✅ [EventApi] Event fetched successfully (status ${response.statusCode})');
      return Event.fromJson(response.data);
    } on Exception catch (e, stack) {
      print('❌ [EventApi] Error loading event $id: $e');
      log('Stack trace:\n$stack');
      
      rethrow;
    }
  }
}
