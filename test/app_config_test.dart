import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_ccid/config/app_config.dart';

void main() {
  group('AppConfig', () {
    test('should return dev environment by default', () {
      expect(AppConfig.environment, BuildEnvironment.dev);
    });

    test('should return correct apiBaseUrl default', () {
      expect(AppConfig.apiBaseUrl, 'https://api-dev.example.com');
    });

    test('should return correct isProduction', () {
      expect(AppConfig.isProduction, false);
    });

    test('should return correct isDevelopment', () {
      expect(AppConfig.isDevelopment, true);
    });

    test('should return correct appName for dev', () {
      expect(AppConfig.appName, 'LB1 Dev');
    });
  });
}
