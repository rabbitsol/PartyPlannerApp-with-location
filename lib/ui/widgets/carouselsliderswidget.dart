import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:partyplannerapp/ui/model/appstring.dart';

class CarouselSlidersWidget extends StatefulWidget {
  const CarouselSlidersWidget(
      {super.key, required this.items, required this.txt, required this.press});
  final List<Widget> items;
  final VoidCallback press;
  final String txt;
  @override
  State<CarouselSlidersWidget> createState() => _CarouselSlidersWidgetState();
}

class _CarouselSlidersWidgetState extends State<CarouselSlidersWidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.press,
          child: Column(children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox(
                width: 370,
                child: CarouselSlider(
                  items: widget.items,
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 440,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.items.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _current == entry.key ? 13 : 10,
                        height: _current == entry.key ? 13 : 10,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ]),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: ListTile(
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
                  widget.txt,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            subtitle: Container(
              // color: Colors.red,
              child: Text(
                AppString.dashboarddetailedtext1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        )
      ],
    );
  }
}
