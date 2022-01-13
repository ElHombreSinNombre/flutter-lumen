import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final List<Marker> _markers = <Marker>[];
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(markerId: const MarkerId('Test'), position: _center));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final map = GoogleMap(
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
      markers: Set<Marker>.of(_markers),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );

    return SafeArea(child: Scaffold(body: map));
  }
}
