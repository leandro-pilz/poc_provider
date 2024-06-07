import 'package:flutter/material.dart';
import 'package:poc_provider/app/modules/home/home_controller.dart';
import 'package:poc_provider/core/states/movie_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HomeController>().getMovies();
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Selector<HomeController, MovieState>(
          selector: (_, movie) => movie.state,
          builder: (_, state, __) {
            return switch (state) {
              MovieLoadingState() => const Center(child: CircularProgressIndicator()),
              MovieErrorState() => Center(child: Text('Error ${state.error}')),
              MovieGetState() => ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Título: ${state.movies[index].title}'),
                      subtitle: Text('Descrição: ${state.movies[index].overview}'),
                    );
                  },
                ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
