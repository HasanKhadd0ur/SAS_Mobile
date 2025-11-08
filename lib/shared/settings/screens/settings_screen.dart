import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sas_mobile/shared/settings/providers/language_provider.dart';
import 'package:sas_mobile/shared/settings/providers/theme_provider.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final currentLocale = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Section
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Theme',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose your preferred theme mode',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  ...AppThemeMode.values.asMap().entries.map((entry) {
                    final index = entry.key;
                    final mode = entry.value;
                    return Column(
                      children: [
                        RadioListTile<AppThemeMode>(
                          title: Text(mode.displayName),
                          subtitle: Text(_getThemeDescription(mode) ?? ''),
                          value: mode,
                          groupValue: themeMode,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          onChanged: (value) {
                            if (value != null) {
                              ref.read(themeProvider.notifier).setTheme(value);
                            }
                          },
                        ),
                        if (index < AppThemeMode.values.length - 1)
                          const Divider(height: 1),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Language Section
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.language_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Language',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select your preferred language',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  ...AppLanguages.supportedLocales.asMap().entries.map((entry) {
                    final index = entry.key;
                    final locale = entry.value;
                    return Column(
                      children: [
                        RadioListTile<Locale>(
                          title: Text(AppLanguages.getLanguageName(locale)),
                          subtitle: Text(AppLanguages.getLanguageCode(locale)),
                          value: locale,
                          groupValue: currentLocale,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          onChanged: (value) {
                            if (value != null) {
                              ref.read(languageProvider.notifier).setLanguage(value);
                            }
                          },
                        ),
                        if (index < AppLanguages.supportedLocales.length - 1)
                          const Divider(height: 1),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _getThemeDescription(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return 'Use light theme';
      case AppThemeMode.dark:
        return 'Use dark theme';
      case AppThemeMode.system:
        return 'Follow system setting';
    }
  }
}

