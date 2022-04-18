import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ]; //Creating a list for getting images from the img folder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite, // for maximum widh of screen
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'img/' + images[index],
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 150,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes gives an incredible sense of freedom along with endurane test",
                            color: AppColors.textColor2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
