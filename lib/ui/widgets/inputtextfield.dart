import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:partyplannerapp/screens/locationscreen.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/mapscreen.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {super.key,
      required this.type,
      required this.hints,
      required this.iconss});
  final TextInputType type;
  final String hints;
  final IconData? iconss;
  @override
  State<InputTextField> createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  final TextEditingController _controller = TextEditingController();
  var _address = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(children: [
        TextFormField(
          // controller: ,
          keyboardType: widget.type,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          cursorColor: Colors.black,
          cursorHeight: 20,
          onChanged: (val) {},
          enableSuggestions: true,
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
              prefixIcon: GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapScreen(press: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LocationScreen()));
                          })));
                },
                child: Icon(
                  widget.iconss,
                  size: 26,
                  color: AppColors.locationiconcolor,
                ),
              ),
              hintText: widget.hints,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
          
      ]),
    );
  }

  void _updatedText(val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print(sp.getString('location') ?? "");
    setState(() {
    //   val = (sp.getString('location') ?? "Hello");
      _address = val;
    });
  }

  // void prefText() async {

  // }
}
