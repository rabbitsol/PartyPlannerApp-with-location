import 'package:flutter/material.dart';
import 'package:partyplannerapp/ui/model/appicons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DesignCard extends StatefulWidget {
  const DesignCard({super.key, required this.width, required this.height});
  final double? width;
  final double? height;
  final bool loading = false;
  @override
  State<DesignCard> createState() => DesignCardState();
}

// class DesignCardState extends State<DesignCard> with TickerProviderStateMixin {
class DesignCardState extends State<DesignCard> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            // child: FutureBuilder(
            //     future: imgforcard(),
            //     builder: ((context, snapshot) => const SpinKitDualRing(
            //           color: Colors.black12,
            //           size: 50.0,
            //           duration: Duration(milliseconds: 1200),
            //           // controller: AnimationController(
            //           //     // duration: const Duration(milliseconds: 1000),
            //           //     vsync: this),
            //         )))));

            child: Image(
                height: widget.height,
                width: widget.width,
                image: AssetImage(AppIcons.decore),
                loadingBuilder: (context, child, loading) {
                  if (loading == null) return child;
                  return SizedBox(
                    height: widget.height,
                    width: widget.width,
                    child: const SpinKitDualRing(
                      color: Colors.black26,
                      size: 50.0,
                      duration: Duration(seconds: 10),
                    ),

                    // child: const SpinKitDualRing(
                    //   color: Colors.black26,
                    //   size: 50.0,
                    //   duration: Duration(seconds: 10),
                    // controller: AnimationController(
                    //     duration: const Duration(seconds: 50), vsync: this),
                  );

                  // loading.expectedTotalBytes != null
                  //     ? loading.cumulativeBytesLoaded /
                  //         loading.expectedTotalBytes!
                  // );
                })));
  }
}
