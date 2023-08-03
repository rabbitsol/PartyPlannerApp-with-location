import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/discovervendorscreen.dart';

import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';
import 'package:partyplannerapp/ui/widgets/inputtextfield.dart';

import '../ui/model/appicons.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final bool show = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: AppColors.appbackgroundcolor,
            image: DecorationImage(
                image: AssetImage(AppIcons.appbg),
                scale: 2,
                alignment: Alignment.bottomRight)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(AppString.mylocation,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(letterSpacing: 2)),
                  const SizedBox(height: 25),
                  Text(AppString.getlocation,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18)),
                  const SizedBox(height: 25),
                  InputTextField(type:TextInputType.streetAddress, hints:"xyz street...",
                    iconss: show == false ? Icons.location_on : null)
                ])),
          ),
          bottomNavigationBar: bottombar(context, () async {
            showDialog(
                context: context,
                builder: ((context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.black54,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 5,
                  ));
                }));
            await movtoDash();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DiscoverVendorScreen()));
          }),
        ));
  }

  Widget bottombar(BuildContext context, VoidCallback pres) {
    return SizedBox(
      height: 115,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Powered by Google Maps",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.inputfiledcolor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Back",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.067),
                        elevation: 5,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: pres,
                    child: Text("START",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 14))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> movtoDash() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
