import 'package:clean_stock/promotions/promotion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Promotion toJson() should return a valid JSON map', () {
    final promotion = Promotion(
      id: 1,
      name: 'Sample Promotion',
      description: 'Sample description',
      discountPercentage: 10.0,
      startDate: DateTime(2022, 1, 1),
      endDate: DateTime(2022, 1, 7),
      productIds: ['1', '2', '3'],
      categoryIds: ['4', '5'],
      createdAt: DateTime(2022, 1, 1),
      status: true,
    );

    final json = promotion.toJson();

    expect(json['id'], equals(1));
    expect(json['name'], equals('Sample Promotion'));
    expect(json['description'], equals('Sample description'));
    expect(json['discount_percentage'], equals(10.0));
    expect(json['start_date'], equals('2022-01-01T00:00:00.000'));
    expect(json['end_date'], equals('2022-01-07T00:00:00.000'));
    expect(json['products'], equals(['1', '2', '3']));
    expect(json['categories'], equals(['4', '5']));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['status'], equals(true));
  });

  test('Promotion fromJson() should create a valid Promotion object', () {
    final json = {
      'id': 1,
      'name': 'Sample Promotion',
      'description': 'Sample description',
      'discount_percentage': 10.0,
      'start_date': '2022-01-01T00:00:00.000',
      'end_date': '2022-01-07T00:00:00.000',
      'products': ['1', '2', '3'],
      'categories': ['4', '5'],
      'created_at': '2022-01-01T00:00:00.000',
      'status': true,
    };

    final promotion = Promotion.fromJson(json);

    expect(promotion.id, equals(1));
    expect(promotion.name, equals('Sample Promotion'));
    expect(promotion.description, equals('Sample description'));
    expect(promotion.discountPercentage, equals(10.0));
    expect(promotion.startDate, equals(DateTime(2022, 1, 1)));
    expect(promotion.endDate, equals(DateTime(2022, 1, 7)));
    expect(promotion.productIds, equals(['1', '2', '3']));
    expect(promotion.categoryIds, equals(['4', '5']));
    expect(promotion.createdAt, equals(DateTime(2022, 1, 1)));
    expect(promotion.status, equals(true));
  });

  test('Promotion isActive() should return true when promotion is active', () {
    final promotion = Promotion(
      id: 1,
      name: 'Sample Promotion',
      discountPercentage: 10.0,
      startDate: DateTime(2022, 1, 1),
      endDate: DateTime(2025, 1, 7),
      createdAt: DateTime(2022, 1, 1),
      status: true,
    );

    final isActive = promotion.isActive();

    expect(isActive, equals(true));
  });

  test('Promotion isActive() should return false when promotion is not active',
      () {
    final promotion = Promotion(
      id: 1,
      name: 'Sample Promotion',
      discountPercentage: 10.0,
      startDate: DateTime(2022, 1, 1),
      endDate: DateTime(2022, 1, 7),
      createdAt: DateTime(2022, 1, 1),
      status: false,
    );

    final isActive = promotion.isActive();

    expect(isActive, equals(false));
  });
}
