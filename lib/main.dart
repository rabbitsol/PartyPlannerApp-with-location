import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyplannerapp/screens/homescreen2nd.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Party Planner App',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: AppColors.appbackgroundcolor,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 14)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _showDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackgroundcolor,
      body:
          // GestureDetector(
          //   onTap: () {
          //     _showDialog(context);
          //   },
          //   child:
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  AppString.screen1text1,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
          const SizedBox(height: 70),
          btn(context, AppString.screen1buttontext1, () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen2nd()));
          }),
          const SizedBox(height: 20),
          Text("OR",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 20),
          btn(context, AppString.screen1buttontext2, () {})
        ],
      ),
      // ),
      // )
    );
  }

  Widget btn(BuildContext context, String txt, VoidCallback press) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              fixedSize: Size(MediaQuery.of(context).size.width, 40)),
          child: Text(
            txt,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ));
  }
}

Widget dialogbtn(BuildContext context, String btntxt) {
  return TextButton(
      style: TextButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 30)),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        btntxt,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.locationsicons),
      ));
}

_showDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(
          Icons.location_on,
          color: AppColors.locationsicons,
        ),
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: "Allow ", style: Theme.of(context).textTheme.bodyMedium),
          TextSpan(
              text: "Partay ",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          TextSpan(
              text: "to select location for this device",
              style: Theme.of(context).textTheme.bodyMedium),
        ])),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              dialogbtn(context, AppString.allow),
              dialogbtn(context, AppString.thistime),
              dialogbtn(context, AppString.deny),
            ],
          )
        ],
      );
    },
  );
}

// _locationPermission() async {
//   getUserCurrentLocation().then((value) async {
//     print("${value.latitude} ${value.longitude}");

//     // _markers.add(Marker(
//     //   markerId: const MarkerId("2"),
//     //   position: LatLng(value.latitude, value.longitude),
//     //   infoWindow: const InfoWindow(
//     //     title: 'My Current Location',
//     //   ),
//     // ));

//     // CameraPosition cameraPosition = CameraPosition(
//     //   target: LatLng(value.latitude, value.longitude),
//     //   zoom: 14,
//     // );

//     // final GoogleMapController controller = await _controller.future;
//     // controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//     // setState(() {});
//   });
// }

// Future<Position> getUserCurrentLocation() async {
//   await Geolocator.requestPermission()
//       .then((value) {})
//       .onError((error, stackTrace) async {
//     await Geolocator.requestPermission();
//     print("ERROR$error");
//   });
//   return await Geolocator.getCurrentPosition();
// }
