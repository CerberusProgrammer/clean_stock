import 'package:flutter_test/flutter_test.dart';
import 'package:clean_stock/models/manufacturer.dart';

void main() {
  test('Manufacturer toJson() should return a valid JSON map', () {
    final manufacturer = Manufacturer(
      id: 1,
      name: 'Sample Manufacturer',
      icon: 'sample_icon',
      description: 'Sample description',
      address: 'Sample address',
      website: 'sample_website.com',
      contactEmail: 'sample_email@example.com',
      contactPhone: '1234567890',
      country: 'Sample country',
      city: 'Sample city',
      status: true,
      color: 'sample_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final json = manufacturer.toJson();

    expect(json['id'], equals(1));
    expect(json['name'], equals('Sample Manufacturer'));
    expect(json['icon'], equals('sample_icon'));
    expect(json['description'], equals('Sample description'));
    expect(json['address'], equals('Sample address'));
    expect(json['website'], equals('sample_website.com'));
    expect(json['contact_email'], equals('sample_email@example.com'));
    expect(json['contact_phone'], equals('1234567890'));
    expect(json['country'], equals('Sample country'));
    expect(json['city'], equals('Sample city'));
    expect(json['status'], equals(true));
    expect(json['color'], equals('sample_color'));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['updated_at'], equals('2022-01-07T00:00:00.000'));
  });

  test('Manufacturer fromJson() should create a valid Manufacturer object', () {
    final json = {
      'id': 1,
      'name': 'Sample Manufacturer',
      'icon': 'sample_icon',
      'description': 'Sample description',
      'address': 'Sample address',
      'website': 'sample_website.com',
      'contact_email': 'sample_email@example.com',
      'contact_phone': '1234567890',
      'country': 'Sample country',
      'city': 'Sample city',
      'status': true,
      'color': 'sample_color',
      'created_at': '2022-01-01T00:00:00.000',
      'updated_at': '2022-01-07T00:00:00.000',
    };

    final manufacturer = Manufacturer.fromJson(json);

    expect(manufacturer.id, equals(1));
    expect(manufacturer.name, equals('Sample Manufacturer'));
    expect(manufacturer.icon, equals('sample_icon'));
    expect(manufacturer.description, equals('Sample description'));
    expect(manufacturer.address, equals('Sample address'));
    expect(manufacturer.website, equals('sample_website.com'));
    expect(manufacturer.contactEmail, equals('sample_email@example.com'));
    expect(manufacturer.contactPhone, equals('1234567890'));
    expect(manufacturer.country, equals('Sample country'));
    expect(manufacturer.city, equals('Sample city'));
    expect(manufacturer.status, equals(true));
    expect(manufacturer.color, equals('sample_color'));
    expect(manufacturer.createdAt, equals(DateTime(2022, 1, 1)));
    expect(manufacturer.updatedAt, equals(DateTime(2022, 1, 7)));
  });

  test('Manufacturer toString() should return a formatted string', () {
    final manufacturer = Manufacturer(
      id: 1,
      name: 'Sample Manufacturer',
      icon: 'sample_icon',
      description: 'Sample description',
      address: 'Sample address',
      website: 'sample_website.com',
      contactEmail: 'sample_email@example.com',
      contactPhone: '1234567890',
      country: 'Sample country',
      city: 'Sample city',
      status: true,
      color: 'sample_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final result = manufacturer.toString();

    expect(
        result,
        equals(
            'Manufacturer{id: 1, name: Sample Manufacturer, icon: sample_icon, description: Sample description, address: Sample address, website: sample_website.com, contactEmail: sample_email@example.com, contactPhone: 1234567890, country: Sample country, city: Sample city, status: true, color: sample_color, createdAt: 2022-01-01 00:00:00.000, updatedAt: 2022-01-07 00:00:00.000}'));
  });
}
