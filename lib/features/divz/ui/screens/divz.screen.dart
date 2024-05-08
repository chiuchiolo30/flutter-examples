import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DivzScreen extends StatelessWidget {
  const DivzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _GradientBackground(),
          _SlidingCard(),
        ],
      ),
    );
  }
}

class _GradientBackground extends StatefulWidget {
  const _GradientBackground();

  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<_GradientBackground> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: true);

  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Color?> _animation = ColorTween(
    begin: Colors.green.shade200,
    end: Colors.green.shade900,
  ).animate(_controller);
  late final Animation<Color?> _animation2 = ColorTween(
    begin: Colors.black12,
    end: Colors.black,
  ).animate(_controller2);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.1, 0.9],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _animation.value ?? Colors.green.shade900,
                _animation2.value ?? Colors.red.shade900,
                // Colors.red.shade900,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

class _SlidingCard extends StatefulWidget {
  const _SlidingCard();

  @override
  State<_SlidingCard> createState() => _SlidingCardState();
}

class _SlidingCardState extends State<_SlidingCard> with TickerProviderStateMixin {
  List<String> images = [
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.jpg',
    'assets/img/4.jpg',
    'assets/img/5.jpg',
  ];

  double opacity = 1;
  double scale = 1;
  double incomingScale = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 6).animate(_controller)
      ..addListener(() {
        setState(() {
          scale = _animation.value;

          opacity = 1 - _animation.value / 6;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _controller.reset();
          });
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            currentIndex = currentIndex == 0 ? images.length - 1 : currentIndex - 1;

            opacity = 1.0;
          });
        }
      });

    _animation2 = Tween<double>(begin: 1, end: 0).animate(_controller2)
      ..addListener(() {
        setState(() {
          scale = _animation2.value;
          opacity = _animation2.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _controller2.reset();
          });
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            currentIndex = currentIndex == images.length - 1 ? 0 : currentIndex + 1;

            opacity = 1.0;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...List.generate(images.length, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: _controller.isAnimating ? opacity.clamp(0.0, 1.0) : 1,
                  duration: const Duration(milliseconds: 400),
                  child: Transform(
                    transform: Matrix4.identity()..scale(scale),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          _controller.forward();
                        } else if (details.primaryVelocity! > 0) {
                          _controller2.forward();
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0.1, 0.1),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                images[currentIndex],
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: (!_controller.isAnimating && !_controller2.isAnimating)
                                    ? ClipRRect(
                                        key: ValueKey<int>(currentIndex),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 5,
                                            sigmaY: 5,
                                          ),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            alignment: Alignment.topRight,
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              (currentIndex + 1).toString().padLeft(
                                                    2,
                                                    '0',
                                                  ),
                                              style: GoogleFonts.tienne(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(
                                        key: ValueKey<int>(99),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.005)
                  ..rotateX(-pi / 3),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        color: Colors.white,
                        onPressed: () {
                          _controller.forward();
                        },
                        icon: const Icon(
                          size: 40,
                          FontAwesomeIcons.caretUp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${currentIndex + 1} of ${images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _controller2.forward();
                        },
                        icon: const Icon(
                          size: 40,
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
