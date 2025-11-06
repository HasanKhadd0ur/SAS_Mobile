import '../models/topic.dart';

abstract class ITopicRepository {
  Future<List<Topic>> getAllTopics();
  Future<Topic?> getTopicById(String id);
}
