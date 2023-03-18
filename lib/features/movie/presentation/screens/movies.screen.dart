import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:flutter_examples/features/movie/presentation/bloc/movie_bloc.dart';
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
                    SizedBox(height: responsive.dp(1),),
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
                            child: _Image(
                              path: state.movies[index].backdropPath!,
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
                                  duration: const Duration(milliseconds: 350),
                                  opacity: !state.movies[index].isExpandable!
                                      ? 1
                                      : 0,
                                  child: RichText(
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

class _Image extends StatelessWidget {
  const _Image({
    required this.path,
  });
  final String path;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.fill,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.no_photography, size: 80, color: Color(0xffB1B1B1)),
        Text(
          'NO CONNECTION',
          style: TextStyle(fontSize: 10, letterSpacing: 1),
        )
      ],
    );
  }
}
