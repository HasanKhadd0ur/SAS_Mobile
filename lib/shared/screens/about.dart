import 'package:flutter/material.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About SAS'),
        backgroundColor: Colors.blue.shade900,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/logo/sas-logo.jpg',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),

            // Title
            const Text(
              'About SAS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0d1b2a),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            const Text(
              'The Situation Awareness System (SAS) is a scalable, microservices-based platform designed to monitor and analyze daily and historical events on an interactive map. '
              'By combining social media data scraping, event detection, geolocation inference, and real-time visualization, SAS empowers decision-makers and individuals to stay informed and aware of unfolding situations.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF444444)),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            const Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1b263b),
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              'Our mission is to deliver accurate, timely, and actionable information by leveraging artificial intelligence and deep learning. '
              'SAS enhances situational awareness, supports community resilience, and promotes informed decision-making in a rapidly evolving world.',
              style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF444444)),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 24),
            const Text(
              'Stay aware. Stay informed.',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Color(0xFF0077b6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
