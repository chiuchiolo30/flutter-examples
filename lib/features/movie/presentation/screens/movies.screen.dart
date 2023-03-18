import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/common/helpers/index.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:flutter_examples/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:flutter_examples/features/movie/presentation/screens/movie.screen.dart';
import 'package:flutter_examples/features/movie/presentation/widgets/index.dart';
import 'package:flutter_examples/injection_container.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  static const milliseconds = 500;
  late MovieBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = sl.get<MovieBloc>();
  }

  @override
  void dispose() {
    bloc.add(ResetMovies());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return BlocProvider.value(
      value: sl.get<MovieBloc>()..add(GetMovies()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Movies',
            style: TextStyle(
              fontSize: responsive.dp(2),
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state.movies.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: responsive.dp(1),
                    ),
                    Text(
                      'Cargando...',
                      style: TextStyle(
                        fontSize: responsive.dp(1.6),
                      ),
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: milliseconds),
                  margin: EdgeInsets.all(responsive.dp(1)),
                  height: state.movies[index].isExpandable!
                      ? responsive.dp(30)
                      : responsive.dp(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: state.movies[index].isExpandable!
                          ? Colors.cyanAccent
                          : Colors.white,
                      width: state.movies[index].isExpandable! ? 1 : 0,
                    ),
                    borderRadius: BorderRadius.circular(
                      responsive.dp(1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: responsive.dp(1),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(responsive.dp(1)),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            bloc.add(IsExpandable(index: index));
                          },
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                responsive.dp(1),
                              ),
                            ),
                            alignment: Alignment.center,
                            duration:
                                const Duration(milliseconds: milliseconds),
                            height: state.movies[index].isExpandable!
                                ? responsive.dp(30)
                                : responsive.dp(10),
                            width: state.movies[index].isExpandable!
                                ? responsive.wp(100)
                                : responsive.wp(20),
                            child: Hero(
                              tag: state.movies[index].id!,
                              child: ImageWidget(
                                path: state.movies[index].posterPath!,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: responsive.wp(21),
                          child: Row(
                            children: [
                              Flexible(
                                child: AnimatedOpacity(
                                  duration: const Duration(
                                    milliseconds: milliseconds,
                                  ),
                                  opacity: !state.movies[index].isExpandable!
                                      ? 1
                                      : 0,
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    text: TextSpan(
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text:
                                              '${state.movies[index].title!}\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: responsive.dp(1.6),
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: state.movies[index].overview,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: responsive.dp(1.4),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              log('message');
                                              Navigator.of(context).push(
                                                navegarMapaFadeIn(
                                                  context,
                                                  MovieScreen(
                                                    movie: state.movies[index],
                                                  ),
                                                ),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
