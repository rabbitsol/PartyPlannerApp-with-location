import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/vendorchatscreen.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';
import 'package:partyplannerapp/ui/widgets/carouselsliderswidget.dart';
import 'package:partyplannerapp/ui/widgets/designcard.dart';

class DecoreVendor extends StatefulWidget {
  const DecoreVendor({super.key});
  @override
  State<DecoreVendor> createState() => _DecoreVendorState();
}

class _DecoreVendorState extends State<DecoreVendor> {
  final List<Widget> _card1 = [
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700)
  ];
  final List<Widget> _card2 = [
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700)
  ];
  final List<Widget> _card3 = [
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700)
  ];
  final List<Widget> _card4 = [
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700),
    const DesignCard(width: 500, height: 700)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.76,
      child: ListView(scrollDirection: Axis.vertical, children: [
        Column(children: [
          CarouselSlidersWidget(
            items: _card1,
            txt: AppString.vendorheadtext1,
            press: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const ChatScreen(txt1: "first", txt2: "Decore")));
              });
            },
          ),
          const SizedBox(height: 40),
          CarouselSlidersWidget(
              items: _card2,
              txt: AppString.vendorheadtext2,
              press: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const ChatScreen(txt1: "planner", txt2: "Decore")));
                });
              }),
          const SizedBox(height: 40),
          CarouselSlidersWidget(
              items: _card3,
              txt: AppString.vendorheadtext3,
              press: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChatScreen(
                          txt1: "service provider", txt2: "Decore")));
                });
              }),
          const SizedBox(height: 40),
          CarouselSlidersWidget(
              items: _card4,
              txt: AppString.vendorheadtext4,
              press: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const ChatScreen(txt1: "third", txt2: "Decore")));
                });
              }),
          const SizedBox(height: 40),
        ]),
      ]),
    );
  }
}
