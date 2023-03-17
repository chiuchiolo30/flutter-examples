import 'package:flutter_examples/app/app.dart';
import 'package:flutter_examples/bootstrap.dart';
import 'package:flutter_examples/injection_container.dart' as di;

void main() async {
  await di.setup();
  await bootstrap(() => const App());
}
