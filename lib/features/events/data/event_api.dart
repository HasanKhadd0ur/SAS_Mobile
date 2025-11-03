import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/network/dio_client.dart';
import '../domain/models/event.dart';

class EventApi {
  final DioClient client;
  EventApi(this.client);

  Future<List<Event>> getEventsUpdatedAfter({
    required DateTime lastUpdate,
    int? pageNumber,
    int? pageSize,
  }) async {
    final formattedTime = lastUpdate.toUtc().toIso8601String();

    try {


      final queryParams = {
        'lastUpdated': formattedTime,
        if (pageNumber != null) 'pageNumber': pageNumber,
        if (pageSize != null) 'pageSize': pageSize,
      };

      final response = await client.dio.get(
        '/events/updated-after',
        queryParameters:queryParams
      );

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

      Fluttertoast.showToast(
        msg: "Failed to fetch events. Please check your connection.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Return empty list instead of crashing
      return [];
    }
  }

  Future<Event> getEventById(String id) async {
    try {
      final response = await client.dio.get('/events/$id');
      return Event.fromJson(response.data as Map<String, dynamic>);
    } catch (e, stack) {
      log('[EventApi] Error fetching event by id: $e');
      log('[EventApi] Stack trace:\n$stack');
      
      
      Fluttertoast.showToast(
        msg: "Failed to fetch event details.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

          rethrow;
    }
  }
}
