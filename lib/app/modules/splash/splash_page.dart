import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/splash/splash_controller.dart';
import 'package:poc_provider/core/states/splash_state.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SplashController>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Selector<SplashController, UserState>(
            shouldRebuild: (previous, next) {
              return previous is UserLoadingState && next is UserGetSate;
            },
            selector: (_, state) => state.value,
            builder: (_, state, __) {
              return Text((state is UserGetSate)
                  ? "Usuário logado: ${(controller.value as UserGetSate).user.name}"
                  : "Usuário não está logado");
            },
          ),
          // Consumer<SplashController>(
          Selector<SplashController, UserState>(
            shouldRebuild: (previous, next) {
              return (previous is UserInitSate && next is UserLoadingState) ||
                  (previous is UserLoadingState && next is UserTokenState);
            },
            selector: (_, state) => state.value,
            builder: (_, state, __) {
              if (state is UserTokenState) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.getUser();
                });
              }

              return ElevatedButton(
                onPressed: () => controller.logIn(),
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
