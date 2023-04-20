import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class InfoCardScreen extends StatefulWidget {
  const InfoCardScreen({super.key});

  @override
  State<InfoCardScreen> createState() => _InfoCardScreenState();
}

class _InfoCardScreenState extends State<InfoCardScreen> {
  late final PageController pageController;

  double pageCard = 0;
  int indexCard = 0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.80, initialPage: 1)
      ..addListener(_listenScroll);
    super.initState();
  }

  void _listenScroll() {
    setState(() {
      pageCard = pageController.page!;
      indexCard = pageController.page!.round();
    });
  }

  @override
  void dispose() {
    pageController
      ..removeListener(_listenScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo[400]!,
                  Colors.indigo[300]!,
                  Colors.indigo[200]!,
                ],
              ),
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              final h = constraints.maxHeight;
              // final w = constraints.maxWidth;
              return Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: h * 0.22,
                    child: PageView.builder(
                      controller: pageController,
                      clipBehavior: Clip.none,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        final percent = (pageCard - index).abs();
                        final factor =
                            pageController.position.userScrollDirection ==
                                    ScrollDirection.forward
                                ? 1.0
                                : -1.0;
                        final opacity = percent.clamp(0.0, 0.7);

                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(vector.radians(45 * factor * percent)),
                          child: Opacity(
                            opacity: 1 - opacity,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: responsive.dp(1),
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'https://us.123rf.com/450wm/anyaberkut/anyaberkut1707/anyaberkut170700002/82434905-vuelo-a-par%C3%ADs-viaje-en-avi%C3%B3n-a-francia.jpg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: h * 0.5,
                  ),
                ],
              );
            },
          ),
         
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.dp(1),
              ).copyWith(
                top: responsive.dp(1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: responsive.dp(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(
                          responsive.dp(4),
                        ),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1,
                            sigmaY: 1,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: responsive.dp(3),
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: Colors.white38,
                                fontSize: responsive.dp(1.6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: responsive.dp(2),
                  ),
                  Transform.rotate(
                    angle: -pi / 2,
                    child: Icon(
                      FontAwesomeIcons.sliders,
                      size: responsive.dp(3),
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
