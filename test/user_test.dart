import 'package:clean_stock/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('User toJson() should return a valid JSON map', () {
    final user = User(
      username: 'sample_username',
      email: 'sample_email@example.com',
      token: 'sample_token',
    );

    final json = user.toJson();

    expect(json['username'], equals('sample_username'));
    expect(json['email'], equals('sample_email@example.com'));
    expect(json['token'], equals('sample_token'));
  });

  test('User fromJson() should create a valid User object', () {
    final json = {
      'username': 'sample_username',
      'email': 'sample_email@example.com',
      'token': 'sample_token',
    };

    final user = User.fromJson(json);

    expect(user.username, equals('sample_username'));
    expect(user.email, equals('sample_email@example.com'));
    expect(user.token, equals('sample_token'));
  });

  test('User toString() should return a formatted string', () {
    final user = User(
      username: 'sample_username',
      email: 'sample_email@example.com',
      token: 'sample_token',
    );

    final string = user.toString();

    expect(
      string,
      equals(
          'User(username: sample_username, email: sample_email@example.com, token: sample_token)'),
    );
  });
}
