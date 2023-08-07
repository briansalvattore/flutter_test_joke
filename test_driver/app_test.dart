import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {});

  test('get random joke from network', () async {
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 5));

    final jokeText = find.byValueKey('joke_text');
    final nextButton = find.byValueKey('next_button');

    final strJoke = await driver.getText(jokeText);

    expect(strJoke, isNotEmpty);

    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 5));

    await driver.tap(nextButton);
  });
}
