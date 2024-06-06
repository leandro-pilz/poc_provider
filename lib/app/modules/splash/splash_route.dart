import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/splash/splash_controller.dart';
import 'package:poc_provider/app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class SplashRoute {
  static Widget params({required BuildContext context}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashController>(
          create: (context) => SplashController(
            userRepository: context.read(),
          ),
        ),
      ],
      builder: (context, _) => const SplashPage(),
    );
  }
}
