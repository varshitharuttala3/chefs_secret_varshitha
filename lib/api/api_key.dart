import 'dart:math';

class ApiKey {
  static const String keys = String.fromEnvironment(
    'SPOONACULAR_API_KEY',
    defaultValue: '8a96bcb175dc40378290ec7e2dd53abc',
  );
}
