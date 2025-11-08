import 'package:flutter/material.dart';
import 'package:sas_mobile/shared/l10n/app_localizations.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutScreenTitle),
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
            Text(
              l10n.aboutSasTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0d1b2a),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            Text(
              l10n.aboutSasDescription,
              style: const TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF444444)),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            Text(
              l10n.ourMission,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1b263b),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              l10n.missionDescription,
              style: const TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF444444)),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 24),
            Text(
              l10n.stayAwareTagline,
              style: const TextStyle(
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
