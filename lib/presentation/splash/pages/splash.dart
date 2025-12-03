import 'package:flutter/material.dart';
import 'package:mobile/core/configs/assets/app_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                AppImage.splashBackground
              ))
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end:Alignment.bottomCenter,

                  colors: [
Color(0xff1A1B20)

              ])
            ),
          ),
        ],
      ),
    );
  }
}
