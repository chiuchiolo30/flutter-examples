import 'package:flutter/widgets.dart';
import 'package:flutter_examples/features/movie/index.dart';

enum Routes {

  movies( MoviesScreen() );

  const Routes(this.route);
  final Widget route;

}
