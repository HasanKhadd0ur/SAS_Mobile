import 'package:flutter/material.dart';
import 'package:sas_mobile/features/events/events_routes.dart';
import 'package:sas_mobile/features/topics/domain/errors/topic_errors.dart';
import 'package:sas_mobile/features/topics/domain/models/topic.dart';
import 'package:sas_mobile/features/topics/domain/repositories/i_topic_repository.dart';
import 'package:sas_mobile/features/topics/presenation/widgets/empty_topics_widget.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';

class TopicsScreen extends StatefulWidget {
  final ITopicRepository topicRepository;
  const TopicsScreen({required this.topicRepository, super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  late Future<List<Topic>> _topicsFuture;

  @override
  void initState() {
    super.initState();
    _topicsFuture = widget.topicRepository.getAllTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Topics'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Topic>>(
        future: _topicsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                TopicErrors.failedToFetch,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final topics = snapshot.data!;
            if (topics.isEmpty) {
              return const EmptyTopicsWidget();
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 2.5,
              ),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return _buildTopicCard(topic);
              },
            );
          } else {
            return const EmptyTopicsWidget();
          }
        },
      ),
    );
  }

  Widget _buildTopicCard(Topic topic) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pushNamed(
          context,
          EventsRoutes.eventsByTopic,
            arguments: {
              'topicId': topic.id,
              'topicName': topic.name,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.category, size: 48, color: Colors.grey),
              const SizedBox(height: 10),
              Text(
                topic.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                topic.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
