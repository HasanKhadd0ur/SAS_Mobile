import 'package:flutter/material.dart';
import 'package:sas_mobile/core/navigation/app_route_info.dart';
import 'package:sas_mobile/features/events/events_routes.dart';
import 'package:sas_mobile/shared/shared_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    // Collect routes from modules
    final eventRoutes = EventsRoutes.routeInfos;
    final sharedRoutes = SharedRoutes.routeInfos;

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: Image.asset(
                'assets/logo/sas-logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          ..._buildSection(context, eventRoutes, currentRoute),
          const Divider(),
          ..._buildSection(context, sharedRoutes, currentRoute),
        ],
      ),
    );
  }

  List<Widget> _buildSection(
      BuildContext context, List<AppRouteInfo> routes, String? currentRoute) {
    return routes
        .map(
          (routeInfo) => _buildDrawerItem(
            context,
            icon: routeInfo.icon,
            title: routeInfo.title,
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
          color: isSelected ? Theme.of(context).primaryColor : Colors.black,
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
