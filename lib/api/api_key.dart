import 'dart:math';

class ApiKey {
  static const String keys = String.fromEnvironment(
    'SPOONACULAR_API_KEY',
    defaultValue: 'd9b1b31cd03645a389e6271f076b0d0d',
  );
}
