import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_examples/common/index.dart';
import 'package:flutter_examples/config/index.dart';
import 'package:flutter_examples/features/new_vintage/presentation/screens/grid_list.screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewVintageScreen extends StatefulWidget {
  const NewVintageScreen({
    super.key,
  });

  @override
  State<NewVintageScreen> createState() => _NewVintageScreenState();
}

class _NewVintageScreenState extends State<NewVintageScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Stack(
      children: [
        _Header(responsive: responsive),
        _Marquesina(responsive: responsive),
        _TextShowAll(responsive: responsive),
        _ButtonShowAll(responsive: responsive),
      ],
    );
  }
}

class _Marquesina extends StatefulWidget {
  const _Marquesina({
    required this.responsive,
  });

  final Responsive responsive;

  @override
  State<_Marquesina> createState() => __MarquesinaState();
}

class __MarquesinaState extends State<_Marquesina> {
  final text = ['GARAGE', 'GARAGE', 'GARAGE', 'GARAGE', 'GARAGE', 'GARAGE'];
  final text2 = [
    'INTERNATION',
    'INTERNATION',
    'INTERNATION',
    'INTERNATION',
    'INTERNATION',
    'INTERNATION'
  ];
  final text3 = ['NEW', 'NEW', 'NEW', 'NEW', 'NEW', 'NEW'];
  final text4 = [
    'VINTAGE',
    'VINTAGE',
    'VINTAGE',
    'VINTAGE',
    'VINTAGE',
    'VINTAGE'
  ];

  final scrollController = ScrollController();
  final scrollController2 = ScrollController();
  final scrollController3 = ScrollController();
  final scrollController4 = ScrollController();
  final fontSize = 8.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      start();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController2.dispose();
    scrollController3.dispose();
    scrollController4.dispose();
    super.dispose();
  }

  void start() {
    final max = scrollController.position.maxScrollExtent;
    scrollController.animateTo(
      max,
      duration: const Duration(seconds: 6),
      curve: Curves.linear,
    );
    final max2 = scrollController2.position.maxScrollExtent;
    scrollController2.animateTo(
      max2,
      duration: const Duration(seconds: 6),
      curve: Curves.linear,
    );
    final max3 = scrollController3.position.maxScrollExtent;
    scrollController3.animateTo(
      max3,
      duration: const Duration(seconds: 6),
      curve: Curves.linear,
    );
    final max4 = scrollController4.position.maxScrollExtent;
    scrollController4.animateTo(
      max4,
      duration: const Duration(seconds: 6),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.responsive.dp(19),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              width: widget.responsive.width,
              height: widget.responsive.dp(12),
              child: SingleChildScrollView(
                reverse: true,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      text.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.responsive.dp(6),
                        ),
                        child: Text(
                          text[index],
                          style: TextStyle(
                            fontSize: widget.responsive.dp(fontSize),
                            letterSpacing: widget.responsive.dp(0.6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: widget.responsive.width,
              height: widget.responsive.dp(12),
              child: SingleChildScrollView(
                reverse: true,
                controller: scrollController2,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      text2.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.responsive.dp(6),
                        ),
                        child: Text(
                          text2[index],
                          style: TextStyle(
                            fontSize: widget.responsive.dp(fontSize),
                            letterSpacing: widget.responsive.dp(0.6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: widget.responsive.width,
              height: widget.responsive.dp(12),
              child: SingleChildScrollView(
                reverse: true,
                controller: scrollController3,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      text3.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.responsive.dp(6),
                        ),
                        child: Text(
                          text3[index],
                          style: TextStyle(
                            fontSize: widget.responsive.dp(fontSize),
                            letterSpacing: widget.responsive.dp(0.6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: widget.responsive.width,
              height: widget.responsive.dp(12),
              child: SingleChildScrollView(
                reverse: true,
                controller: scrollController4,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      text4.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.responsive.dp(6),
                        ),
                        child: Text(
                          text4[index],
                          style: TextStyle(
                            fontSize: widget.responsive.dp(fontSize),
                            letterSpacing: widget.responsive.dp(0.6),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonShowAll extends StatefulWidget {
  const _ButtonShowAll({
    required this.responsive,
  });

  final Responsive responsive;

  @override
  State<_ButtonShowAll> createState() => _ButtonShowAllState();
}

class _ButtonShowAllState extends State<_ButtonShowAll> {
  bool circle = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -100,
      left: 0,
      right: 0,
      top: 0,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            setState(() {
              circle = !circle;
            });
            Timer(const Duration( milliseconds: 700 ), () { 
              Navigator.push(
                context, navegarMapaFadeIn(context, const GridListScreen()),);
            });
          },
          child: OverflowBox(
            alignment: Alignment.bottomCenter,
            maxHeight: MediaQuery.of(context).size.longestSide * 2,
            maxWidth: MediaQuery.of(context).size.longestSide * 2,
            minHeight: widget.responsive.dp(8),
            minWidth: widget.responsive.dp(8),
            child: AnimatedContainer(
              margin: EdgeInsets.only(
                bottom: circle ? widget.responsive.dp(12) : 0,
              ),
              alignment: Alignment.center,
              height:
                  circle ? widget.responsive.dp(8) : widget.responsive.dp(120),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              duration: const Duration(milliseconds: 700),
              child: Opacity(
                opacity: circle ? 1 : 0,
                child: Icon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.white,
                  size: widget.responsive.dp(2.2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextShowAll extends StatelessWidget {
  const _TextShowAll({
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: responsive.dp(12),
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: 1,
          child: Align(
            child: Text(
              'show all',
              style: TextStyle(
                fontSize: responsive.dp(1.7),
                color: Colors.black26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.dp(2),
        vertical: responsive.dp(1),
      ),
      alignment: Alignment.topCenter,
      height: double.infinity,
      color: const Color(0xFFF5F5F5),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.registered,
              size: responsive.dp(2),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'drop 18.10\n',
                    style: TextStyle(
                      fontSize: responsive.dp(1.7),
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'new york',
                    style: TextStyle(
                      fontSize: responsive.dp(1.7),
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
