import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo/sas-logo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.map,
            title: 'Map View',
            route: '/map',
            currentRoute: currentRoute,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.event_note,
            title: 'Daily Events',
            route: '/home',
            currentRoute: currentRoute,
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.info_outline,
            title: 'About',
            route: '/about',
            currentRoute: currentRoute,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.help_outline,
            title: 'FAQ',
            route: '/faq',
            currentRoute: currentRoute,
          ),
        ],
      ),
    );
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
        Navigator.pop(context); // close drawer first
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}
