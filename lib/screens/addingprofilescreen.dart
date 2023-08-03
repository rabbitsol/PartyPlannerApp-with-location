import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partyplannerapp/screens/locationscreen.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';
import 'package:partyplannerapp/ui/widgets/bottomnavcontainer.dart';

import '../ui/model/appicons.dart';

class AddingProfileScreen extends StatefulWidget {
  const AddingProfileScreen({super.key});

  @override
  State<AddingProfileScreen> createState() => _AddingProfileScreenState();
}

class _AddingProfileScreenState extends State<AddingProfileScreen> {
  String? imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(

        // constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: AppColors.appbackgroundcolor,
            image: DecorationImage(
              // fit: BoxFit.fitHeight,
              scale: 2,
              alignment: Alignment.bottomRight,
              image: AssetImage(
                AppIcons.appbg,
              ),
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.addingdptext1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(letterSpacing: 2)),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(AppString.addingdptext2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18)),
                ),
                const SizedBox(height: 35),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Card(
                        shape: const CircleBorder(),
                        elevation: 10,
                        child: CircleAvatar(
                            radius: 110,
                            child: imgPath != null
                                ? CircleAvatar(
                                    radius: 110,
                                    foregroundImage: FileImage(File(imgPath!)))
                                : null)),
                    Padding(
                        padding: const EdgeInsets.only(top: 150, right: 12),
                        child: IconButton(
                            onPressed: () {
                              media();
                            },
                            icon: const Icon(Icons.add_circle, size: 30)))
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: bottomNavContainer(context, () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LocationScreen()));
          }),
        ));
  }

  void media() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imgPath = file.path;
      setState(() {});
    }
  }
}
