// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

const _interviewer = [
  'Good morning, have you found the office easily? I hope so.',
  'Tell me about yourself. Your CV says you are a very qualified professional.',
  'Why do you want to join this company?',
  'I see your point, could you start tomorrow?',
];

const _applicant = [
  'Good morning. Oh yes, it hasn’t been difficult at all to get here from the bus station.',
  'That’s right. I have high qualifications on my MA and also a lot of experience in the technology industry.',
  'I want to work with you because this is the best company in the country. Being part of this team will improve my career.',
  'Of course I could.',
];

const emojis = ['👍', '❤️', '😂', '😧', '👎'];

enum MessageType { sent, received }

class Message {
  Message({required this.text, required this.type});
  final String text;
  final MessageType type;
}

class ChatBoxScreen extends StatefulWidget {
  const ChatBoxScreen({super.key});

  @override
  State<ChatBoxScreen> createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> with TickerProviderStateMixin {
  MessageType messageType = MessageType.sent;
  MessageType messageType2 = MessageType.received;
  List<Message> messages = [];
  @override
  void initState() {
    super.initState();

    _loadMessages();
  }

  void _loadMessages() {
    for (var i = 0; i < _interviewer.length; i++) {
      messages.add(Message(text: _interviewer[i], type: MessageType.sent));
      if (i < _applicant.length) {
        messages.add(Message(text: _applicant[i], type: MessageType.received));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Interview Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedList(
          initialItemCount: messages.length,
          itemBuilder: (BuildContext context, int index, Animation<double> animation) {
            final key = ValueKey<int>(index);

            final animationController = AnimationController(
              duration: const Duration(milliseconds: 500),
              vsync: this,
            );

            final delay = Duration(milliseconds: index * 1200);

            Future.delayed(delay, animationController.forward);

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animationController,
                  curve: Curves.easeIn,
                ),
                child: Padding(
                  key: key,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ChatBubble(
                    messageType: messages[index].type,
                    message: messages[index].text,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    required this.messageType,
    required this.message,
    super.key,
  });
  final MessageType messageType;
  final String message;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool _showEmoji = false;

  String reaction = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.messageType == MessageType.sent)
          Column(
            children: [
              const CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              const SizedBox(
                height: 5,
              ),
              if (reaction.isNotEmpty)
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey<String>(reaction),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(reaction),
                  ),
                ),
            ],
          ),
        Expanded(
          child: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  CustomPaint(
                    painter: TrianglePainter(
                      messageType: widget.messageType,
                      color: Colors.blue,
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => setState(() => _showEmoji = true),
                    child: MessageContent(
                      messageType: widget.messageType,
                      message: widget.message,
                      color: Colors.blue,
                    ),
                  ),
                  Visibility(
                    visible: _showEmoji,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Wrap(
                          children: [
                            for (final emoji in emojis)
                              GestureDetector(
                                onTap: () {
                                  setState(() => _showEmoji = false);

                                  setState(() {
                                    if (reaction == emoji) {
                                      reaction = '';
                                    } else {
                                      reaction = emoji;
                                    }
                                  });
                                },
                                child: Padding(
                                  key: ValueKey<String>(emoji),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: Text(
                                    emoji,
                                    style: const TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.messageType == MessageType.received)
          Column(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(
                height: 5,
              ),
              if (reaction.isNotEmpty)
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey<String>(reaction),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(reaction),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class MessageContent extends StatelessWidget {
  const MessageContent({
    required this.messageType,
    required this.message,
    required this.color,
    super.key,
  });

  final MessageType messageType;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: messageType == MessageType.sent ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: messageType == MessageType.sent
            ? const BorderRadius.all(Radius.circular(10)).copyWith(
                topLeft: Radius.zero,
              )
            : const BorderRadius.all(Radius.circular(10)).copyWith(
                topRight: Radius.zero,
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '12:00',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    required this.messageType,
    required this.color,
    super.repaint,
  });
  final MessageType messageType;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (messageType == MessageType.sent) {
      path
        ..moveTo(0, 0)
        ..lineTo(size.width / 2, 0)
        ..lineTo(size.width / 2, size.height);
    } else {
      path
        ..moveTo(size.width / 2, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width / 2, size.height);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
