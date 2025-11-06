import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/network/dio_client.dart';
import '../domain/models/topic.dart';
import '../domain/errors/topic_errors.dart';

class TopicApi {
  final DioClient client;
  TopicApi(this.client);

  Future<List<Topic>> getAllTopics() async {
    try {
      final response = await client.dio.get('/topics');
      final data = response.data;

      if (data is List) {
        return data.map((e) => Topic.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        log('[TopicApi] Unexpected data format: $data');
        return [];
      }
    } catch (e, stack) {
      log('[TopicApi] Error fetching topics: $e');
      log('[TopicApi] Stack trace:\n$stack');
      _showErrorToast(TopicErrors.failedToFetch);
      return [];
    }
  }

  Future<Topic> getTopicById(String id) async {
    try {
      final response = await client.dio.get('/topics/$id');
      return Topic.fromJson(response.data as Map<String, dynamic>);
    } catch (e, stack) {
      log('[TopicApi] Error fetching topic by ID: $e');
      log('[TopicApi] Stack trace:\n$stack');
      _showErrorToast(TopicErrors.failedToFetchById);
      rethrow;
    }
  }


  void _showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
