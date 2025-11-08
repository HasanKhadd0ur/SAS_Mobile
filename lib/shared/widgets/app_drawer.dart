import 'package:flutter/material.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';
import 'package:sas_mobile/features/events/events_routes.dart';
import 'package:sas_mobile/features/topics/topics_routes.dart';
import 'package:sas_mobile/shared/l10n/app_localizations.dart';
import 'package:sas_mobile/shared/l10n/app_localizations_extensions.dart';
import 'package:sas_mobile/shared/shared_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final l10n = AppLocalizations.of(context)!;

    // Collect routes from modules
    final eventRoutes = EventsRoutes.routeInfos;
    final topicsRoutes = TopicsRoutes.routeInfos;
    final sharedRoutes = SharedRoutes.routeInfos;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/logo/sas-logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          ..._buildSection(context, eventRoutes, currentRoute, l10n),
          const Divider(),
          ..._buildSection(context, topicsRoutes, currentRoute, l10n),
          const Divider(),
          ..._buildSection(context, sharedRoutes, currentRoute, l10n),
        ],
      ),
    );
  }

  List<Widget> _buildSection(
      BuildContext context, List<AppRouteInfo> routes, String? currentRoute, AppLocalizations l10n) {
    return routes
        .map(
          (routeInfo) => _buildDrawerItem(
            context,
            icon: routeInfo.icon,
            title: l10n.getByKey(routeInfo.titleKey),
            route: routeInfo.path,
            currentRoute: currentRoute,
          ),
        )
        .toList();
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    required String? currentRoute,
  }) {
    final bool isSelected = route == currentRoute;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: isSelected 
              ? Theme.of(context).primaryColor 
              : Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () {
        Navigator.pop(context);
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
