import 'package:flutter/widgets.dart';
import 'package:flutter_examples/features/chat_bubble/index.dart';
import 'package:flutter_examples/features/mario_bros/index.dart';
import 'package:flutter_examples/features/movie/index.dart';
import 'package:flutter_examples/features/new_vintage/index.dart';

enum Routes {
  chat(ChatBoxScreen()),
  newVintage(NewVintageScreen()),
  movies(MoviesScreen()),
  marioBros(MarioBrosScreen());

  const Routes(this.route);
  final Widget route;
}
