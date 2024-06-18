import 'package:flutter/material.dart';
import 'package:flutter_application_4/home_screen.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';

class SlideScreen extends StatelessWidget {
  const SlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: Image.asset(
              'asset/bg.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned.fill(
            top: Get.height * 0.5,
            child: Text(
              'Explore Your\nFavorte Journey',
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                height: 1.2,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: Get.height * 0.5 + 80,
            child: Text(
              'Let\'s make our life so a life',
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontSize: 15,
                height: 1.1,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.65,
            left: Get.width * 0.42,
            child: RotatedBox(
              quarterTurns: 3,
              child: SliderButton(
                action: () async {
                  Get.offAll(const HomeScreen());
                  return true;
                },
                width: 150,
                backgroundColor: Colors.black.withOpacity(0.5),
                buttonColor: Colors.black,
                buttonSize: 55,
                label: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "Go",
                    style: GoogleFonts.prompt(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
