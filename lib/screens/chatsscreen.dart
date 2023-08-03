import 'package:flutter/material.dart';

import '../ui/model/appcolors.dart';
import '../ui/model/appicons.dart';
import '../ui/model/appstring.dart';
import '../ui/widgets/appbars.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  int select = 0;
  double selectedradiusActive = 0;
  final double radius1 = 35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: appbars("Chats", const Text(""))),
        body: Container(
            color: AppColors.appbackgroundcolor,
            child: Column(children: [
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
              const Divider(
                thickness: 1,
                height: 5,
              ),
              Column(children: [
                listtileforlist("first"),
                const Divider(
                  thickness: 1,
                  height: 3,
                ),
                listtileforlist("planner"),
                const Divider(
                  thickness: 1,
                  height: 3,
                ),
              ])
            ])));
  }

  Widget listtileforlist(String person) {
    return ListTile(
      horizontalTitleGap: 10,
      // tileColor: Colors.cyanAccent,
      minLeadingWidth: 20,
      leading: SizedBox(
        width: 70,
        height: 70,
        // color: Colors.red,
        child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black,
            child: Text(AppString.discover,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 5, color: Colors.white))),
      ),
      title: Container(
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            person,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
        ),
      ),
      subtitle: Container(
        // color: Colors.red,
        child: Text(
          "Hey $person!\n${AppString.chatshistory}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      trailing: SizedBox(
        // color: Colors.red,
        width: 70,
        height: 40,
        child: Text(AppString.period,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black)),
      ),
    );
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
