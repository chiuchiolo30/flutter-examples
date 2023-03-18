import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:flutter_examples/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:flutter_examples/injection_container.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return BlocProvider.value(
      value: sl.get<MovieBloc>()..add(GetMovies()),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text('Vacio'),
              );
            }

            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(responsive.dp(1)),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(
                      responsive.dp(1),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(responsive.dp(1)),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              responsive.dp(1),
                            ),
                          ),
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 700),
                          height: responsive.dp(20),
                          width: responsive.dp(14),
                          child:
                              _Image(path: state.movies[index].backdropPath!),
                        ),
                        SizedBox(
                          width: responsive.dp(1),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: '${state.movies[index].title!}\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: responsive.dp(1.6),
                                  ),
                                ),
                                TextSpan(
                                  text: state.movies[index].overview,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: responsive.dp(1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.path,
  });
  final String path;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      placeholder: const AssetImage('assets/img/loading.gif'),
      placeholderErrorBuilder: (_, __, ___) =>
          const CircularProgressIndicator.adaptive(),
      image: NetworkImage(
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$path',
      ),
      imageErrorBuilder: (_, __, ___) => const _NoPicture(),
    );
  }
}

class _NoPicture extends StatelessWidget {
  const _NoPicture();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const <Widget>[
          Icon(Icons.no_photography, size: 80, color: Color(0xffB1B1B1)),
          Text(
            'NO CONNECTION',
            style: TextStyle(fontSize: 10, letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
