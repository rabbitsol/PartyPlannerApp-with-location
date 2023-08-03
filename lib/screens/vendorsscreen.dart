import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/photographervendor.dart';
import 'package:partyplannerapp/screens/reantalvendor.dart';
import '../ui/model/appcolors.dart';
import '../ui/model/appicons.dart';
import '../ui/widgets/appbars.dart';
import 'entertainervendor.dart';
import 'ballooncard.dart';
import 'cakevendor.dart';
import 'decorevendor.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {

  int select = 0;
  double selectedradiusActive = 0;
  final double radius1 = 35;
  final vendor = [
    const BalloonVendor(),
    const CakeVendor(),
    const DecoreVendor(),
    const EntertainerVendor(),
    const PhotographerVendor(),
    const RentalVendor(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: appbars("Discover Vendors", const Text(""))),
        body: Container(
          color: AppColors.appbackgroundcolor,
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          circle(context, select == 0, () {
                            setState(() {
                              select = 0;
                              radius1;
                            });
                          }, "Balloons", AppIcons.balloons1,
                              AppColors.category1color),
                          const SizedBox(width: 10),
                          circle(context, select == 1, () {
                            setState(() {
                              select = 1;
                              radius1;
                            });
                          }, "Cake", AppIcons.cake, AppColors.category2color),
                          const SizedBox(width: 10),
                          circle(context, select == 2, () {
                            setState(() {
                              select = 2;
                              radius1;
                            });
                          }, "Decore", AppIcons.decore,
                              AppColors.category3color),
                          const SizedBox(width: 5),
                          circle(context, select == 3, () {
                            setState(() {
                              select = 3;
                              radius1;
                            });
                          }, "Entertainers", AppIcons.entertainers,
                              AppColors.category4color),
                          // const SizedBox(width: 10),
                          circle(context, select == 4, () {
                            setState(() {
                              select = 4;
                              radius1;
                            });
                          }, "Photographers", AppIcons.photography,
                              AppColors.category5color),
                          circle(context, select == 5, () {
                            setState(() {
                              select = 5;
                              radius1;
                            });
                          }, "Rentals", AppIcons.rentals,
                              AppColors.category6color),
                        ],
                      ))),
              const Divider(thickness: 1),
              Center(
                child: vendor[select],
              )
            ],
          ),
        ));
  }

  circle(BuildContext context, bool selected, VoidCallback ontap, String txt,
      String img, Color colorss,
      {Widget? icons}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icons ??
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: selected ? radius1 : 33.5,
                child: CircleAvatar(
                  radius: 32.25,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: colorss,
                    radius: 30.5,
                    child: Image.asset(
                      img,
                      width: 30,
                    ),
                  ),
                ),
              ),
          Text(txt,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black))
        ],
      ),
    );
  }
}
