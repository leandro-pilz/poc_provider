import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/splash/splash_controller.dart';
import 'package:poc_provider/core/states/splash_state.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SplashController>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('SplashPage'),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (BuildContext context, state, Widget? child) {
              return ElevatedButton(
                onPressed: () {},
                child: (state is UserLoadingState)
                    ? const CircularProgressIndicator()
                    : const Text('Entrar'),
              );
            },
          ),
        ],
      ),
    );
  }
}
