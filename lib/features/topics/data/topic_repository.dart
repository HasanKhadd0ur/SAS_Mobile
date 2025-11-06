import 'package:sas_mobile/features/topics/domain/models/topic.dart';
import 'package:sas_mobile/features/topics/domain/repositories/i_topic_repository.dart';
import 'topic_api.dart';

class TopicRepository implements ITopicRepository {
  final TopicApi api;

  TopicRepository(this.api);

  @override
  Future<List<Topic>> getAllTopics() async {
    return await api.getAllTopics();
  }

  @override
  Future<Topic?> getTopicById(String id) async {
    return await api.getTopicById(id);
  }
}
