import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;

class GGMap extends StatefulWidget {
  const GGMap({super.key});

  @override
  State<GGMap> createState() => _GGMapState();
}

class _GGMapState extends State<GGMap> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(10.865210, 106.758997),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
