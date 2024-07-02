import 'package:clean_stock/models/ccategory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Category toJson() should return a valid JSON map', () {
    final category = Category(
      id: 1,
      parentId: 'parent',
      name: 'Sample Category',
      icon: 'category_icon',
      description: 'Sample description',
      status: true,
      color: 'category_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final json = category.toJson();

    expect(json['id'], equals(1));
    expect(json['parent'], equals('parent'));
    expect(json['name'], equals('Sample Category'));
    expect(json['icon'], equals('category_icon'));
    expect(json['description'], equals('Sample description'));
    expect(json['status'], equals(true));
    expect(json['color'], equals('category_color'));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['updated_at'], equals('2022-01-07T00:00:00.000'));
  });

  test('Category fromJson() should create a valid Category object', () {
    final json = {
      'id': 1,
      'parent': 'parent',
      'name': 'Sample Category',
      'icon': 'category_icon',
      'description': 'Sample description',
      'status': true,
      'color': 'category_color',
      'created_at': '2022-01-01T00:00:00.000',
      'updated_at': '2022-01-07T00:00:00.000',
    };

    final category = Category.fromJson(json);

    expect(category.id, equals(1));
    expect(category.parentId, equals('parent'));
    expect(category.name, equals('Sample Category'));
    expect(category.icon, equals('category_icon'));
    expect(category.description, equals('Sample description'));
    expect(category.status, equals(true));
    expect(category.color, equals('category_color'));
    expect(category.createdAt, equals(DateTime(2022, 1, 1)));
    expect(category.updatedAt, equals(DateTime(2022, 1, 7)));
  });

  test('Category toString() should return a formatted string representation',
      () {
    final category = Category(
      id: 1,
      parentId: 'parent',
      name: 'Sample Category',
      icon: 'category_icon',
      description: 'Sample description',
      status: true,
      color: 'category_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final result = category.toString();

    expect(
        result,
        equals(
            'Category{id: 1, parentId: parent, name: Sample Category, icon: category_icon, description: Sample description, status: true, color: category_color, createdAt: 2022-01-01 00:00:00.000, updatedAt: 2022-01-07 00:00:00.000}'));
  });
}
