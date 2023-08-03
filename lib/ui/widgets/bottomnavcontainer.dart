import 'package:flutter/material.dart';

Widget bottomNavContainer(BuildContext context, VoidCallback pressed) {
  return Container(
    padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Back",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            )),
        TextButton(
            onPressed: pressed,
            child: Text("Next",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal))),
      ],
    ),
  );
}
