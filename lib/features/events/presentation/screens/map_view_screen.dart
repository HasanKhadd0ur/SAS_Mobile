import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas_mobile/shared/widgets/app_drawer.dart';
import 'package:sas_mobile/shared/widgets/map_marker.dart';
import '../../domain/models/event.dart';
import '../../data/event_repository.dart';

class MapViewScreen extends StatefulWidget {
  final EventRepository eventRepository;

  const MapViewScreen({super.key, required this.eventRepository});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  final MapController _mapController = MapController();
  List<Event> _events = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    try {
      final events = await widget.eventRepository.fetchDailyEvents();
      setState(() {
        _events = events;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _getInitialCenter(),
                    initialZoom: 6,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'sas_mobile',
                    ),
                  MarkerLayer(
                    markers: _events.map((event) {
                      return Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(
                          event.location.latitude,
                          event.location.longitude,
                        ),
                        child: MapMarkerWidget(
                          event: event,
                          onTap: () => _showEventDialog(event),
                        ),
                      );
                    }).toList(),
                  ), 
                ],
              ),
    );
  }

  LatLng _getInitialCenter() {
    if (_events.isNotEmpty) {
      return LatLng(
        _events.first.location.latitude,
        _events.first.location.longitude,
      );
    }
    return const LatLng(34.8021, 38.9968); // Default: Syria
  }

  void _showEventDialog(Event event) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(event.eventInfo.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.eventInfo.summary),
            const SizedBox(height: 8),
            Text('Topic: ${event.topic.name}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
