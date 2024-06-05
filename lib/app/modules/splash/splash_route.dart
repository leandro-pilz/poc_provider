import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/splash/splash_controller.dart';
import 'package:poc_provider/app/modules/splash/splash_page.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class SplashRoute {
  static Widget params({required BuildContext context}) {
    return MultiProvider(
      providers: [
        Provider<SplashController>(
          create: (context) => SplashController(
            userRepository: context.read(),
          ),
        ),
      ],
      builder: (context, _) => const SplashPage(),
    );
  }
}
