import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LatLng userPosition;

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

    return userPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pontos de coleta'),
      ),
      body: FutureBuilder(
        future: getUserLocation(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: snapshot.data,
                zoom: 15,
              ),
               markers: {
                Marker(
                  markerId: MarkerId('userPosition'),
                  position: snapshot.data!,
                  infoWindow: InfoWindow(title: 'Sua localização'),
                ),
              },
              mapType: MapType.normal,
            );
          }
          return const Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
