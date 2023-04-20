import 'package:flutter/widgets.dart';

import 'package:flutter_examples/features/info_card/index.dart';
import 'package:flutter_examples/features/mario_bros/index.dart';
import 'package:flutter_examples/features/movie/index.dart';
import 'package:flutter_examples/features/new_vintage/index.dart';

enum Routes {
  infoCard(InfoCardScreen()),
  newVintage(NewVintageScreen()),
  movies(MoviesScreen()),
  marioBros(MarioBrosScreen());

  const Routes(this.route);
  final Widget route;
}
