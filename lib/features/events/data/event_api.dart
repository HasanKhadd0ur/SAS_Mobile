import '../../../core/network/dio_client.dart';
import '../domain/models/event.dart';

class EventApi {
  final DioClient client;
  EventApi(this.client);

  Future<List<Event>> getDailyEvents() async {
    final resp = await client.dio.get('/events/daily');
    final data = resp.data as List<dynamic>;
    return data.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }
}
