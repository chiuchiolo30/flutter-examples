import 'dart:math' as math;
import 'package:flutter/cupertino.dart';


class Responsive {

 

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _height   = size.height;
    _width    = size.width;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  late double _diagonal;
  late double _height;
  late double _width;

  

  double get diagonal => _diagonal;
  double get height   => _height;
  double get width    => _width;  

  double wp(double percent) => _width * (percent / 100);
  double hp(double percent) => _height * (percent / 100);
  double dp(double percent) => _diagonal * (percent / 100);
}
