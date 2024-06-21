import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? userPosition;

  Future<LatLng> getUserLocation() async {
    Location location = Location();
    LocationData userLocation;

    PermissionStatus status = await location.requestPermission();
    bool active = await location.serviceEnabled();

    if (status == PermissionStatus.granted && active) {
      userLocation = await location.getLocation();
      userPosition = LatLng(userLocation.latitude!, userLocation.longitude!);
    } else {
      userPosition = const LatLng(-22.557483, -47.412402);
    }

    return userPosition!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontos de coleta'),
      ),
      body: FutureBuilder<LatLng>(
        future: getUserLocation(),
        builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: snapshot.data!,
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('userPosition'),
                  position: snapshot.data!,
                  infoWindow: const InfoWindow(title: 'Sua localização'),
                ),
              },
              mapType: MapType.normal,
            );
          } else {
            return const Center(
              child: Text('Unable to determine location'),
            );
          }
        },
      ),
    );
  }
}
