
// Simple splash screen implementation
import 'package:flutter/material.dart';
import 'package:sas_mobile/features/events/data/event_repository.dart';

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
            Text('Situation Awareness'),
          ],
        ),
      ),
    );
  }
}