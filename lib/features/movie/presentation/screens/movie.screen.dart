import 'package:flutter/material.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:flutter_examples/features/movie/domain/index.dart';
import 'package:flutter_examples/features/movie/presentation/widgets/index.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title!,
          style: TextStyle(
            fontSize: responsive.dp(2),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: widget.movie.id!,
            child: Container(
              height: responsive.dp(30),
              child: ImageWidget(path: widget.movie.posterPath!),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(responsive.dp(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.movie.title!} (${widget.year()})',
                  style: TextStyle(
                    fontSize: responsive.dp(2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: responsive.dp(0.4),
                ),
                Text(
                  widget.movie.overview!,
                  style: TextStyle(
                    fontSize: responsive.dp(1.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension Helpers on MovieScreen {
  String year() => movie.releaseDate!.split('-').first;
}
