import 'package:flutter/material.dart';
import 'package:flutter_examples/common/helpers/index.dart';
import 'package:flutter_examples/config/responsive.config.dart';
import 'package:flutter_examples/config/routes.config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final fontSizeTitleAppBar = responsive.dp(2.6);
    final fontSizeTitleButton = responsive.dp(1.6);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter examples',
          style: TextStyle(
            fontSize: fontSizeTitleAppBar,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...Routes.values.map(
              (e) => MaterialButton(
                color: const Color(0xFF13B9FF),
                onPressed: () {
                  Navigator.push(context, navegarMapaFadeIn(context, e.route));
                },
                child: Text(
                  firstLetterCapitalized(e.name),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeTitleButton,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension Helpers on HomeScreen {
  String firstLetterCapitalized(String text) => text.replaceRange(
        0,
        1,
        text[0].toUpperCase(),
      );
}
