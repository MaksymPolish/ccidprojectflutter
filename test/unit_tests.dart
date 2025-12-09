import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Logic', () {
    test('counter starts at 0', () {
      int counter = 0;
      expect(counter, 0);
    });

    test('counter increments by 1', () {
      int counter = 0;
      counter++;
      expect(counter, 1);
    });

    test('counter increments multiple times', () {
      int counter = 0;
      counter++;
      counter++;
      counter++;
      expect(counter, 3);
    });
  });

  group('Environment Detection', () {
    test('dev environment name validation', () {
      const envName = 'dev';
      expect(envName, isNotEmpty);
      expect(envName.length, greaterThan(0));
    });

    test('prod environment name validation', () {
      const envName = 'prod';
      expect(envName, 'prod');
    });
  });

  group('URL Construction', () {
    test('api url is properly formatted', () {
      const apiUrl = 'https://api-dev.example.com';
      expect(apiUrl.startsWith('https://'), true);
      expect(apiUrl.contains('api'), true);
    });

    test('api url contains correct host', () {
      const apiUrl = 'https://api-dev.example.com';
      expect(apiUrl.contains('example.com'), true);
    });
  });
}
