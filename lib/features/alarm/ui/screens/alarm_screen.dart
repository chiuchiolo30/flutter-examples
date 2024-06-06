import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  AlarmScreenState createState() => AlarmScreenState();
}

class AlarmScreenState extends State<AlarmScreen> {
  double _offsetX = 0;
  double _offsetX2 = -1;
  double _offsetY = 0;
  double _offsetY2 = 0;
  int startNumber = 30;
  int startHour = 0;

  final _duration = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_offsetX2 == 0) {
              _offsetX2 = -1;
            } else {
              _offsetX2 = 0;
            }
          });
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 5,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final y = _offsetY * constraints.maxHeight;
                    return AnimatedContainer(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      duration: _duration,
                      transform: Matrix4.translationValues(0, y, 0),
                      child: Column(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Alarm',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(FontAwesomeIcons.angleDown),
                                    ),
                                  ],
                                ),
                                // const Spacer(),
                                const Text(
                                  '09:41',
                                  style: TextStyle(
                                    fontSize: 110,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'The next alarm clock in ',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    children: const [
                                      TextSpan(
                                        text: '19 min',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                      24,
                                      (index) => const VerticalDivider(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final y = _offsetY * MediaQuery.of(context).size.height;
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: _offsetY == 0 ? 1 : 0,
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(10),
                      duration: _duration,
                      transform: Matrix4.translationValues(0, y, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Mon',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Tue',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Wed',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Text(
                              'Thu',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            'Fri',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Sat',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Sun',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final x = _offsetX * constraints.maxWidth;
                          return AnimatedContainer(
                            height: double.infinity,
                            duration: _duration,
                            transform: Matrix4.translationValues(x, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('9:50', style: Theme.of(context).textTheme.displayLarge),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.play),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final x = _offsetX * -1 * constraints.maxWidth * 1.5;
                          return OverflowBox(
                            maxWidth: constraints.maxWidth * 1.5,
                            child: AnimatedContainer(
                              padding: const EdgeInsets.all(10),
                              height: double.infinity,
                              duration: _duration,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              transform: Matrix4.translationValues(x, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('10:50', style: Theme.of(context).textTheme.displayLarge),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final y = _offsetY * -1 * constraints.maxHeight;
                    return AnimatedContainer(
                      padding: const EdgeInsets.all(20),
                      duration: _duration,
                      transform: Matrix4.translationValues(0, y, 0),
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            child: IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: const Icon(
                                FontAwesomeIcons.calendar,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _offsetX = -1;
                                  _offsetY = -1;
                                });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Flexible(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width * 5,
                  maxHeight: MediaQuery.of(context).size.height * 5,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment(1.01, 0.0),
                          // alignment: Alignment.centerRight,
                          child: AnimatedContainer(
                            transform: Matrix4.translationValues(_offsetX2 == 0 ? 0 : MediaQuery.of(context).size.width, 0, 0),
                            duration: _duration,
                            width: MediaQuery.of(context).size.width * 2.5,
                            height: MediaQuery.of(context).size.height * 2.5,
                            child: GestureDetector(
                              onVerticalDragUpdate: (details) {
                                setState(() {
                                  if (details.delta.dy > 0) {
                                    startNumber--;
                                  } else if (details.delta.dy < 0) {
                                    startNumber++;
                                  }
                                  if (startNumber > 59) {
                                    startNumber = 0;
                                  } else if (startNumber < 0) {
                                    startNumber = 59;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Stack(
                                  children: [
                                    ...List<int>.generate(24, (index) => index).map((index) {
                                      var number = (startNumber + index) % 60;
                                      double angle = 2 * math.pi * (index / 24);

                                      double fontSize = 70;
                                      double scale = 0.5 * (math.cos(2 * math.pi * (index + 12) / 24) + 1);

                                      final radius = MediaQuery.of(context).size.width * 1.13;
                                      return Transform.translate(
                                        offset: Offset.fromDirection(
                                          angle,
                                          radius,
                                        ),
                                        child: Transform.scale(
                                          scale: scale,
                                          child: Text(
                                            '${number.toString().padLeft(2, '0')}',
                                            key: ValueKey<int>(number),
                                            style: TextStyle(
                                              fontSize: fontSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          // alignment: Alignment.centerLeft,
                          alignment: Alignment(-1.01, 0.0),
                          child: AnimatedContainer(
                            width: MediaQuery.of(context).size.width * 2.5,
                            height: MediaQuery.of(context).size.height * 2.5,
                            duration: _duration,
                            transform: Matrix4.translationValues(_offsetX2 == 0 ? 0 : -MediaQuery.of(context).size.width, 0, 0),
                            child: GestureDetector(
                              onVerticalDragUpdate: (details) async {
                                await Future<void>.delayed(const Duration(milliseconds: 100));
                                setState(() {
                                  if (details.delta.dy > 0) {
                                    startHour--;
                                  } else if (details.delta.dy < 0) {
                                    startHour++;
                                  }
                                  if (startHour > 23) {
                                    startHour = 0;
                                  } else if (startHour < 0) {
                                    startHour = 23;
                                  }
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Stack(
                                  children: [
                                    ...List<int>.generate(24, (index) => index).map((index) {
                                      var hour = (index + startHour) % 24;
                                      double angle = 2 * math.pi * index / 24;

                                      double fontSize = 70;
                                      double scale = 0.5 * (math.cos(2 * math.pi * (index) / 24) + 1);

                                      final radius = MediaQuery.of(context).size.width * 1.12;
                                      return Transform.translate(
                                        offset: Offset.fromDirection(
                                          angle,
                                          radius,
                                        ),
                                        child: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 500),
                                          transitionBuilder: (Widget child, Animation<double> animation) {
                                            return ScaleTransition(child: child, scale: animation);
                                          },
                                          child: Transform.scale(
                                            scale: scale,
                                            child: Text(
                                              '${hour.toString().padLeft(2, '0')}',
                                              key: ValueKey<int>(hour),
                                              style: TextStyle(
                                                fontSize: fontSize,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          // child: Text(
                                          //   '${hour.toString().padLeft(2, '0')}',
                                          //   key: ValueKey<int>(hour),
                                          //   style: TextStyle(
                                          //     fontSize: fontSize,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.music),
                      Text(
                        'Sound',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Wake up',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.bell),
                      Text(
                        'Snooze',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Every 10 min',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.repeat),
                      Text(
                        'Repeat',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'No',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 30,
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.x),
                      ),
                    ),
                    const Text(
                      'Choose time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.check),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Align(
          //   child: CircleAvatar(
          //     backgroundColor: Colors.black,
          //     radius: MediaQuery.of(context).size.width * 0.5,
          //     child: Stack(
          //       children: [
          //         ...List<int>.generate(20, (index) => index).map((index) {
          //           double angle = math.pi / 10 * index; // Ajusta este valor para cambiar la separación entre los números
          //           double fontSize = 20 * (1 - math.cos(angle));
          //           double radius = MediaQuery.of(context).size.width * 0.45;
          //           return Transform.translate(
          //             offset: Offset.fromDirection(
          //               angle,
          //               radius,
          //             ),
          //             child: Text(
          //               '${index + 1}',
          //               style: TextStyle(
          //                 fontSize: fontSize,
          //                 color: Colors.white,
          //               ),
          //             ),
          //           );
          //         }),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
