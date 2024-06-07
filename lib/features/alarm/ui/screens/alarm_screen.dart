import 'dart:developer';
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
  double _offsetY2 = 1;
  int startNumber = 30;
  int startHour = 0;
  int minute = 0;
  bool _move = false;
  var selectedHour = 0;
  var selectedMinute = 0;

  final _duration = const Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _move = !_move;
      //     });
      //   },
      //   child: const Icon(FontAwesomeIcons.plus),
      // ),
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
                      onEnd: () {
                        if (_offsetX == 0) return;
                        setState(() {
                          if (_offsetX2 == 0) {
                            _offsetX2 = -1;
                          } else {
                            _offsetX2 = 0;
                          }
                          if (_offsetY2 == 1) {
                            _offsetY2 = -1;
                          } else {
                            _offsetY2 = 1;
                          }
                        });
                      },
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ...List.generate(144, (index) {
                                            final height = index % 6 == 0 ? 10.0 : 3.0;
                                            return Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: AnimatedContainer(
                                                    width: 2,
                                                    height: height,
                                                    color: Colors.white,
                                                    duration: _duration,
                                                  ),
                                                ),
                                                if (index % 6 == 0) // Cada 6 líneas representan una hora
                                                  Text(
                                                    '${index ~/ 6}:00', // Muestra la hora
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: AnimatedContainer(
                                                    width: 2,
                                                    height: height,
                                                    color: Colors.white,
                                                    duration: _duration,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 100,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 2,
                                            height: double.infinity,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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
                          alignment: const Alignment(1.01, 0),
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
                                      final number = (startNumber + index) % 60;
                                      if (index == 12) {
                                        setState(() {
                                          selectedMinute = number;
                                        });
                                      }
                                      final angle = 2 * math.pi * (index / 24);

                                      const fontSize = 70.0;
                                      final scale = 0.5 * (math.cos(2 * math.pi * (index + 12) / 24) + 1);

                                      final radius = MediaQuery.of(context).size.width * 1.13;
                                      return Transform.translate(
                                        offset: Offset.fromDirection(
                                          angle,
                                          radius,
                                        ),
                                        child: Transform.scale(
                                          scale: scale,
                                          child: Text(
                                            number.toString().padLeft(2, '0'),
                                            key: ValueKey<int>(number),
                                            style: const TextStyle(
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
                          alignment: const Alignment(-1.01, 0),
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
                                      final hour = (index + startHour) % 24;
                                      final angle = 2 * math.pi * index / 24;

                                      if (index == 0) {
                                        setState(() {
                                          selectedHour = hour;
                                        });
                                      }

                                      const fontSize = 70.0;
                                      final scale = 0.5 * (math.cos(2 * math.pi * (index) / 24) + 1);

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
                                              hour.toString().padLeft(2, '0'),
                                              key: ValueKey<int>(hour),
                                              style: const TextStyle(
                                                fontSize: fontSize,
                                                color: Colors.black,
                                              ),
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
                      Center(
                        child: AnimatedOpacity(
                          opacity: _offsetX2 == 0 ? 1 : 0,
                          duration: _duration,
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
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _offsetY2 == 1 ? 0 : 1,
                duration: const Duration(milliseconds: 150),
                child: AnimatedContainer(
                  duration: _duration,
                  transform: Matrix4.translationValues(0, _offsetY2 == 1 ? MediaQuery.of(context).size.height / 4 : 0, 0),
                  child: const Row(
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
                ),
              ),
              AnimatedContainer(
                padding: const EdgeInsets.all(8),
                onEnd: () {
                  log('end $_offsetX2 $_offsetY2 $_offsetX $_offsetY');
                  if (_offsetX2 == -1.0 && _offsetY2 == 1.0 && _offsetX == -1.0 && _offsetY == -1.0 && !_move) {
                    log('entro');
                    setState(() {
                      _offsetX = 0;
                      _offsetY = 0;
                    });
                  }
                },
                duration: _duration,
                transform: Matrix4.translationValues(0, _offsetY2 == 1 && !_move ? MediaQuery.of(context).size.height / 10 : 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 30,
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            if (_offsetX2 == 0) {
                              _offsetX2 = -1;
                            } else {
                              _offsetX2 = 0;
                            }
                            if (_offsetY2 == 1) {
                              _offsetY2 = -1;
                            } else {
                              _offsetY2 = 1;
                            }
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.x),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          duration: _duration,
                          transform: Matrix4.translationValues(0, _move == true ? MediaQuery.of(context).size.height / 10 : 0, 0),
                          child: const Text(
                            'Choose time',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: _duration,
                          transform: Matrix4.translationValues(0, _move == false ? MediaQuery.of(context).size.height / 10 : 0, 0),
                          child: const Text(
                            'Remove all Points',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 30,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            _move = true;
                          });

                          setState(() {
                            _offsetX2 = -1;
                            _offsetY2 = 1;
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.check),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 480,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: _duration,
              opacity: _move ? 1 : 0,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 140,
                child: Stack(
                  children: [
                    ...List.generate(60, (index) {
                      final angle = 2 * math.pi * index / 60;
                      const radius = 130.0;
                      return Transform.translate(
                        offset: Offset.fromDirection(
                          angle,
                          radius,
                        ),
                        child: Transform.rotate(
                          angle: angle - math.pi / 2,
                          child: AnimatedContainer(
                            width: 2,
                            height: _move ? 10 : 1,
                            color: Colors.grey[400],
                            duration: _duration,
                          ),
                        ),
                      );
                    }),
                    ...List.generate(5, (index) {
                      final angle = 2 * math.pi * index / 5;
                      const radius = 100.0;
                      return Transform.rotate(
                        angle: angle - math.pi / 2,
                        child: Transform.translate(
                          offset: Offset.fromDirection(
                            angle,
                            radius,
                          ),
                          child: Transform.rotate(
                            angle: angle - math.pi / 2,
                            child: AnimatedContainer(
                              duration: _duration,
                              width: 2,
                              height: _move ? 12 : 1,
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
          AnimatedPositioned(
            duration: _duration,
            top: _move ? 600 : 302,
            left: _move ? 142 : 98,
            child: AnimatedDefaultTextStyle(
              duration: _duration,
              style: TextStyle(
                fontSize: !_move ? 70 : 35,
                color: !_move ? Colors.transparent : Colors.black,
                fontWeight: FontWeight.w500,
              ),
              child: Text(
                selectedHour.toString().padLeft(2, '0'),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            top: _move ? 600 : 298,
            left: 182,
            child: AnimatedDefaultTextStyle(
              duration: _duration,
              style: TextStyle(
                fontSize: !_move ? 70 : 35,
                color: !_move ? Colors.transparent : Colors.black,
                fontWeight: FontWeight.w500,
              ),
              child: const Text(
                ':',
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            top: _move ? 600 : 302,
            left: _move ? 192 : 204,
            child: AnimatedDefaultTextStyle(
              duration: _duration,
              style: TextStyle(
                fontSize: !_move ? 70 : 35,
                color: !_move ? Colors.transparent : Colors.black,
                fontWeight: FontWeight.w500,
              ),
              child: Text(
                selectedMinute.toString().padLeft(2, '0'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
