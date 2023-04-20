import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_examples/config/index.dart';

class MarioBrosScreen extends StatefulWidget {
  const MarioBrosScreen({super.key});

  @override
  State<MarioBrosScreen> createState() => _MarioBrosScreenState();
}

class _MarioBrosScreenState extends State<MarioBrosScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  double onVerticalDragUpdate = 0.00;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(onVerticalDragUpdate * (-pi / 4)),
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    print(
                        'onVerticalDragUpdate: ${(details.localPosition.dy / 1000).clamp(0.0001, 1)}');

                    setState(() {
                      onVerticalDragUpdate =
                          (details.localPosition.dy / 1000).clamp(0.0001, 1);
                    });
                  },
                  onVerticalDragEnd: (details) {
                    print('END');
                    setState(() {
                      onVerticalDragUpdate = 0.0;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(responsive.dp(1)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(responsive.dp(1)),
                      gradient: LinearGradient(
                        colors: const [
                          Colors.black,
                          Colors.black87,
                          Colors.black54,
                          Colors.black45,
                          Colors.black38,
                          Colors.black26,
                          Colors.black12,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment(0, 1 - onVerticalDragUpdate),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/mariob-1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(responsive.dp(1)),
                        gradient: LinearGradient(
                          colors: const [
                            Colors.black,
                            Colors.black87,
                            Colors.black54,
                            Colors.black45,
                            Colors.black38,
                            Colors.black26,
                            Colors.black12,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment(0, 1 - onVerticalDragUpdate),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: responsive.hp(-100),
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                  ..translate(0.000001, -responsive.hp((onVerticalDragUpdate * 140)), 0),
                   
                  child: Image.asset(
                    'assets/img/mariob-2.png',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
