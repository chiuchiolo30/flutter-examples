import 'package:flutter/widgets.dart';
import 'package:flutter_examples/features/alarm/ui/screens/alarm_screen.dart';
import 'package:flutter_examples/features/chat_bubble/index.dart';
import 'package:flutter_examples/features/divz/ui/screens/divz.screen.dart';
import 'package:flutter_examples/features/mario_bros/index.dart';
import 'package:flutter_examples/features/movie/index.dart';
import 'package:flutter_examples/features/new_vintage/index.dart';

enum Routes {
  alarm(AlarmScreen()),
  chat(ChatBoxScreen()),
  divz(DivzScreen()),
  marioBros(MarioBrosScreen()),
  movies(MoviesScreen()),
  newVintage(NewVintageScreen());

  const Routes(this.route);
  final Widget route;
}
