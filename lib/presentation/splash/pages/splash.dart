import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/common/helper/navigation/app_navigation.dart';
import 'package:mobile/core/configs/assets/app_image.dart';
import 'package:mobile/presentation/auth/pages/signin.dart';
import 'package:mobile/presentation/home/pages/home.dart';
import 'package:mobile/presentation/splash/bloc/splash_cubit.dart';
import 'package:mobile/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigation.pushReplacement(context, SignInPage());
          }
          if (state is Authenticated) {
            AppNavigation.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.splashBackground),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,

                  colors: [Color(0xff1A1B20).withAlpha(0), Color(0xff1A1B20)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
