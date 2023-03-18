import 'package:flutter/cupertino.dart';
import 'package:flutter_examples/app/app.dart';
import 'package:flutter_examples/bootstrap.dart';
import 'package:flutter_examples/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await bootstrap(() => const App());
}
