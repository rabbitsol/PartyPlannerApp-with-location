import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapScreen extends StatefulWidget {
  final VoidCallback press;

//  final String currentAddress;

  const MapScreen({super.key, required this.press});
  // ,required this.currentAddress});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(31.42778, 74.36111),
    zoom: 10,
  );

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  final List<Marker> _markers = <Marker>[];

  static Future<String> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
    List<Placemark> addresses =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    var first = addresses.first;
    print("${first.name} ${first.locality}");

    // return widget.currentAddress;
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("location",
        "${first.street}, ${first.name}, ${first.subLocality}, ${first.locality}, ${first.country}");

    return "${first.street}, ${first.name}, ${first.subLocality}, ${first.locality}, ${first.country}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGoogle,
          markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (argument) {
            _showDialog();
          },
        ),
      ),
    );
  }

  Future<Position> getLocation() async {
    // Test if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            Exception('Location permissions are permanently denied.'));
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(Exception('Location permissions are denied.'));
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selected Location"),
          content: FutureBuilder(
              future: _getLocation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    width: 5,
                    height: 5,
                    child: CircularProgressIndicator(color: Colors.amber),
                  );
                }
                return Text(snapshot.data.toString());
              }),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            ElevatedButton(
                onPressed: widget.press,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(115, 30)),
                child: const Text("Done", style: TextStyle(letterSpacing: 2))),
            const SizedBox(width: 2),
            OutlinedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  debugPrint('location: ${position.latitude}');
                  List<Placemark> addresses = await placemarkFromCoordinates(
                      position.latitude, position.longitude);

                  var first = addresses.first;
                  print("${first.name} ${first.locality}"
                      "${first.street}, ${first.name}, ${first.subLocality}, ${first.locality}, ${first.country}");
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2),
                    fixedSize: const Size(115, 30),
                    foregroundColor: Colors.black),
                child: const Text("Try Again",
                    style: TextStyle(letterSpacing: 2))),
          ],
        );
      },
    );
  }
}
