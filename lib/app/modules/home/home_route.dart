import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/home/home_controller.dart';
import 'package:poc_provider/app/modules/home/home_page.dart';
import 'package:poc_provider/app/repositories/movie_repository_imp.dart';
import 'package:poc_provider/core/repositories/movie_repository.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  static Widget params() {
    return MultiProvider(
      providers: [
        Provider<MovieRepository>(create: (context) => MovieRepositoryImp(api: context.read())),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(repository: context.read()),
        ),
      ],
      builder: (context, _) => const HomePage(),
    );
  }
}
