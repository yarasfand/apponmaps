import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class addressOnMap extends StatefulWidget {
  const addressOnMap({super.key});

  @override
  State<addressOnMap> createState() => _addressOnMapState();
}

class _addressOnMapState extends State<addressOnMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6845, 73.049), zoom: 14);

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(33.684, 73.074),
        infoWindow: InfoWindow(title: 'Title'))
  ];

  Future<Position> getUserLocation() async {
    await Geolocator.getCurrentPosition()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error is" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserLocation().then((value) async {
            print("My Location Is: ");
            print("Latitide is "+ value.latitude.toString() + " & Longitude is: " + value.longitude.toString());

            _markers.add(Marker(
                markerId: MarkerId("1"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: "My Location")));
            CameraPosition cameraPosition = CameraPosition(
                zoom: 14, target: LatLng(value.latitude, value.longitude));

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

            setState(() {

            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}
