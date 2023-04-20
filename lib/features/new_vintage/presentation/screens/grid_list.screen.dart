import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_examples/config/responsive.config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridListScreen extends StatefulWidget {
  const GridListScreen({super.key});

  @override
  State<GridListScreen> createState() => _GridListScreenState();
}

class _GridListScreenState extends State<GridListScreen> {
  bool start = false;
  bool img = false;
  bool img2 = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        start = true;
      });
    });
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        img = true;
      });
    });
    Timer(const Duration(milliseconds: 900), () {
      setState(() {
        img2 = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Material(
            child: AnimatedContainer(
              padding: EdgeInsets.only(
                top: responsive.dp(5),
                left: responsive.dp(1),
                right: responsive.dp(1),
              ),
              duration: const Duration(milliseconds: 1000),
              color: const Color(0xFFF5F5F5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'NEW YORK',
                        style: TextStyle(
                          fontSize: responsive.dp(4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: responsive.dp(1),
                      ),
                      Icon(
                        FontAwesomeIcons.globe,
                        size: responsive.dp(3),
                      )
                    ],
                  ),
                  SizedBox(
                    height: responsive.dp(4),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(responsive.dp(3)),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: responsive.hp(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(responsive.dp(3)),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: img ? responsive.hp(20) : 0,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          'assets/img/image03.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsive.dp(1),
                  ),
                  SizedBox(
                    // color: Colors.red,
                    height: responsive.hp(50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              responsive.dp(3),
                            ),
                            child: Container(
                              alignment: Alignment.topCenter,
                              height: responsive.hp(50),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F5F5),
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                height: img2 ? responsive.hp(50) : 0,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Image.asset(
                                  'assets/img/image01.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: responsive.dp(1),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: responsive.dp(6),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  responsive.dp(3),
                                ),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  // width: responsive.wp(40),
                                  height: responsive.hp(20),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.circular(responsive.dp(3)),
                                  ),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    height: img2 ? responsive.hp(20) : 0,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Image.asset(
                                      'assets/img/image04.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: responsive.dp(1),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  responsive.dp(3),
                                ),
                                child: Container(
                                  // width: responsive.wp(40),
                                  alignment: Alignment.topCenter,
                                  height: responsive.hp(20),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    height: img2 ? responsive.hp(20) : 0,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Image.asset(
                                      'assets/img/image02.jpg',
                                      fit: BoxFit.fill,
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
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          // top: 0,
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            color: Colors.black,
            height: !start ? responsive.height : 0,
          ),
        ),
      ],
    );
  }
}
