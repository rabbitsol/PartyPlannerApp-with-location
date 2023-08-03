import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/emailscreen.dart';
import 'package:partyplannerapp/ui/model/appicons.dart';
import 'package:partyplannerapp/ui/widgets/bottomnavcontainer.dart';
import '../ui/model/appcolors.dart';

class HomeScreen2nd extends StatelessWidget {
  const HomeScreen2nd({super.key});

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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(children: [
                        const SizedBox(height: 35),
                        Text(
                          "HELLO",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.screen2card, fontSize: 36),
                        ),
                        Text("my name is",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.screen2card, fontSize: 20))
                      ])),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: Colors.transparent,
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 38,
                          color: AppColors.inputfiledcolor,
                          fontWeight: FontWeight.bold),
                      cursorColor: AppColors.inputfiledcolor,
                      cursorHeight: 40,
                      textAlign: TextAlign.center,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                          hintText: 'Dr Geller',
                          hintStyle: TextStyle(
                              fontSize: 38,
                              color: AppColors.inputfiledcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  )
                ],
              ),
              // ),
            ),
            bottomNavigationBar: bottomNavContainer(context, () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EmailScreen()));
            })));
  }
}
