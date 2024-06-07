import 'package:flutter/material.dart';
import 'package:poc_provider/app/http/api_imp.dart';
import 'package:poc_provider/app/http/dio_client.dart';
import 'package:poc_provider/app/modules/home/home_route.dart';
import 'package:poc_provider/app/repositories/user_repository_imp.dart';
import 'package:poc_provider/core/http/api.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioClient>(create: (_) => DioClient()),
        Provider<Api>(create: (context) => ApiImp(dio: context.read<DioClient>().dio)),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImp(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: HomeRoute.params(),
        // home: SplashRoute.params(),
      ),
    );
  }
}
