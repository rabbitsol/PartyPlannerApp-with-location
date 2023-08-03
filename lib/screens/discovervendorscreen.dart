import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/profilescreen.dart';
import 'package:partyplannerapp/screens/vendorsscreen.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/model/appicons.dart';

import 'chatsscreen.dart';

class DiscoverVendorScreen extends StatefulWidget {
  const DiscoverVendorScreen({super.key});

  @override
  State<DiscoverVendorScreen> createState() => _DiscoverVendorScreenState();
}

class _DiscoverVendorScreenState extends State<DiscoverVendorScreen> {
  int pageIndex = 0;
  final page = [
    const VendorsScreen(),
    const ProfileScreen(),
    const ChatsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackgroundcolor,
      body: page[pageIndex],
      extendBody: true,
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 30,
        // color: AppColors.appbackgroundcolor,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
              // border: Border.all(width: 1, color: Colors.black),
              color: AppColors.appbackgroundcolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconWidget(AppIcons.vendor, pageIndex == 0, () {
                  setState(() {
                    pageIndex = 0;
                  });
                }),
                iconWidget(
                  AppIcons.profile,
                  pageIndex == 1,
                  () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                ),
                iconWidget(
                  AppIcons.chats,
                  pageIndex == 2,
                  () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  iconWidget(String icon, bool selected, VoidCallback ontap, {Widget? icons}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icons ??
              ImageIcon(
                AssetImage(icon),
                color: selected
                    ? Colors.black
                    : const Color.fromARGB(255, 166, 173, 31),
              ),
          // if (selected)
          //   ImageIcon(
          //     AssetImage(AppIcons.navrectangleforselected),
          //     color: const Color(0xff2C91EF),
          //   ),
        ],
      ),
    );
  }
}
