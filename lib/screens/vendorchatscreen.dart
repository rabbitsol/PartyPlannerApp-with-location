import 'package:flutter/material.dart';
import 'package:partyplannerapp/ui/model/appcolors.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.txt1, required this.txt2});
  final String txt1;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM dd").format(DateTime.now());
    return Scaffold(
      backgroundColor: AppColors.appbackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(AppString.chatscreenheading,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 70),
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.black,
                    child: Text(AppString.discover),
                  ),
                  const SizedBox(height: 20),
                  Text("$txt1 - $txt2",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black)),
                  const SizedBox(height: 15),
                  Text(
                    date,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.datecolor),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Card(
                  color: AppColors.chatcolor,
                  margin: const EdgeInsets.only(right: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Hey first! \nAre you available to chat right now?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.chattextcolor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text("a minute ago",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.datecolor, fontSize: 14)),
              ),
            )

            // ),
          ],
        ),
      ),
      bottomNavigationBar: defaultchat(context),
    );
  }

  Widget defaultchat(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Material(
        // shape: Border.all(width: 1, color: Colors.black),
        borderOnForeground: true,
        color: AppColors.appbackgroundcolor,
        elevation: 30,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Text(
                  "Talk to the vendor about what you need or send a picture!",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.chattextcolor),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1025,
                      width: MediaQuery.of(context).size.width * 0.425,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hey first! \nAre you available to chat right now?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.chattextcolor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hey first! \nCan you give me quote for this picture?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.chattextcolor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(children: [
                  const Icon(Icons.camera_alt_outlined),
                  const SizedBox(width: 15),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.77,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Message first ...",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 147, 154, 53)),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, top: 10),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(
                                  right: 10.0,
                                  bottom: 5,
                                ),
                                child: Icon(
                                  Icons.send,
                                  color: Color.fromARGB(255, 147, 154, 53),
                                ),
                              ),
                              border: InputBorder.none),
                        ),
                      )),
                ]),
              ],
            )),
      ),
    );
  }
}
