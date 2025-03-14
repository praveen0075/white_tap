import 'package:flutter/material.dart';
import 'package:white_tap/constants/const.dart';
import 'package:white_tap/pages/home_page.dart';
import 'package:white_tap/styles/styles.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // kh60,
              Image.asset("assets/images/nikelogo.png", height: 250),
              kh75,
              Text("Just Do It ", style: introPageTitleTextStyle),
              kh20,
              Text(
                "Brand new  sneakers  and custom kicks made with premium quality",
                style: introPageSubtitleTextStyle,
                textAlign: TextAlign.center,
              ),
              kh40,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text("Shop Now", style: introPageButtonTextStyle),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
