import 'package:flutter/material.dart';
import 'package:partyplannerapp/screens/addingprofilescreen.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/widgets/bottomnavcontainer.dart';
import 'package:partyplannerapp/ui/widgets/inputtextfield.dart';

import '../ui/model/appicons.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final bool show = true;

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
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Email",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(width: 15),
                      const Icon(Icons.email_outlined)
                    ],
                  ),
                  const SizedBox(height: 15),
                InputTextField(type:TextInputType.emailAddress,hints: "",
                  iconss:  show == false ? Icons.location_on : null)
                ])),
          ),
          bottomNavigationBar: bottomNavContainer(context, () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddingProfileScreen()));
          })),
    );
  }
}
