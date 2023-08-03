import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partyplannerapp/screens/locationscreen.dart';
import 'package:partyplannerapp/screens/mapscreen.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/widgets/appbars.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final MediaType _mediaType = MediaType.image;

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 65),
            child: appbars("Edit Profile", const Icon(Icons.edit))),
        body: Container(
          color: AppColors.appbackgroundcolor,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        child: imagePath != null
                            ? CircleAvatar(
                                radius: 70,
                                foregroundImage: FileImage(File(imagePath!)))
                            : null,
                      ),
                      IconButton(
                          onPressed: () {
                            media();
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(height: 100),
                  TextFormField(
                    cursorHeight: 0,
                    cursorWidth: 0,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Name",
                      hintText: "need servicess",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    cursorHeight: 0,
                    cursorWidth: 0,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Email (Only visible to you)",
                      hintText: "needservices@demo.com",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MapScreen(
                                press: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen()));
                                },
                              )));
                    },
                    child: TextFormField(
                      cursorHeight: 0,
                      cursorWidth: 0,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: "Location",
                        prefixIcon: const IconTheme(
                          data: IconThemeData(color: AppColors.chattextcolor),
                          child: Icon(Icons.location_on_outlined),
                        ),
                        // prefixIconColor: AppColors.chatcolor,
                        hintText: "Plot 70, Plot 70, Lahore, Pakistan",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowcontent,
                        fixedSize: Size(MediaQuery.of(context).size.width, 65)),
                    child: const Text("Update"),
                  )
                ]),
              ),
            ),
          ),
        ));
  }

  void media() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }
}
