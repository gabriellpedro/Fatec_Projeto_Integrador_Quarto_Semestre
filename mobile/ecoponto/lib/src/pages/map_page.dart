import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapPage extends StatefulWidget {
  @override
  _SimpleMapState createState() => _SimpleMapState();
}


class _SimpleMapState extends State<MapPage> {
  late LocationData locationUser;
  static late LatLng _kMapCenter;

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 30.0, tilt: 0, bearing: 0);

  Set<Marker> _createMarker() {

    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Seu local'),
          rotation: 0),
      Marker(
        markerId: MarkerId("marker_2"),
        infoWindow: InfoWindow(title: 'posto de saúde'),
        position: LatLng(-22.354534, -47.334139),
      ),
    };
  }
  @override
  void initState() {
     Location().getLocation().then((value) => locationUser = value);
     _kMapCenter = LatLng(locationUser.latitude ?? 0, locationUser.longitude ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exibição de mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        mapType: MapType.satellite,
        markers: _createMarker(),
      ),
    );
  }

  getLocation() async {
    final locationUser = Location();
    var locationData = await locationUser.getLocation();
  }
}