import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../features/events/presentation/screens/daily_events_screen.dart';
import '../core/config/environment.dart';
import '../core/network/dio_client.dart';
import '../features/events/data/event_api.dart';
import '../features/events/data/event_repository.dart';


class SasApp extends StatelessWidget {
  const SasApp({super.key});

  @override
  Widget build(BuildContext context) {
    // init network client
    final dioClient = DioClient(baseUrl: Environment.baseUrl);

    // apis and repositories
    final eventApi = EventApi(dioClient);
    final eventRepo = EventRepository(eventApi);

    return MaterialApp(
      title: 'SAS',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(eventRepository: eventRepo),
        '/home': (context) => DailyEventsScreen(eventRepository: eventRepo),
      },
    );
  }
}

// Simple splash screen implementation
class SplashScreen extends StatefulWidget {
  // final AuthRepository authRepository;
  final EventRepository eventRepository;
  const SplashScreen({ required this.eventRepository, super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startUp();
  }

  Future<void> _startUp() async {
    // Simulate startup tasks, e.g., check token
    await Future.delayed(const Duration(milliseconds: 1200));

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            FlutterLogo(size: 96),
            SizedBox(height: 16),
            Text('SAS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Situational Awareness'),
          ],
        ),
      ),
    );
  }
}