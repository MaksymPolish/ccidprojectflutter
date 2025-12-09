import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_ccid/config/environment.dart';

void main() {
  group('Environment', () {
    test('apiUrl has default value', () {
      expect(
        Environment.apiUrl,
        'https://api-dev.example.com',
      );
    });

    test('isProduction is false by default', () {
      expect(Environment.isProduction, false);
    });
  });
}
