import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:map/services/user.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final List<Marker> _markers = <Marker>[];
  late LatLng _center = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    getLocation();
    getMarkers();
  }

  Future getMarkers() async {
    UserService().getAllExample().then((value) {
      setState(() {
        for (var element in value) {
          _markers.add(Marker(
              markerId: MarkerId(element['id'].toString()),
              position: LatLng(double.parse(element['address']['geo']['lat']),
                  double.parse(element['address']['geo']['lng']))));
        }
      });
    });
  }

  Future getLocation() async {
    final location = Location();
    var currentLocation = await location.getLocation();
    setState(() {
      _center = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
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

    return SafeArea(
        child: Scaffold(
            body: _markers.isNotEmpty
                ? map
                : const Center(child: CircularProgressIndicator())));
  }
}
