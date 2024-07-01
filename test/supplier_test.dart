import 'package:clean_stock/models/supplier.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Supplier toJson() should return a valid JSON map', () {
    final supplier = Supplier(
      id: 1,
      name: 'Sample Supplier',
      icon: 'sample_icon',
      description: 'Sample description',
      address: 'Sample address',
      website: 'samplewebsite.com',
      contactEmail: 'sample@email.com',
      contactPhone: '1234567890',
      country: 'Sample country',
      city: 'Sample city',
      status: true,
      color: 'sample_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final json = supplier.toJson();

    expect(json['id'], equals(1));
    expect(json['name'], equals('Sample Supplier'));
    expect(json['icon'], equals('sample_icon'));
    expect(json['description'], equals('Sample description'));
    expect(json['address'], equals('Sample address'));
    expect(json['website'], equals('samplewebsite.com'));
    expect(json['contact_email'], equals('sample@email.com'));
    expect(json['contact_phone'], equals('1234567890'));
    expect(json['country'], equals('Sample country'));
    expect(json['city'], equals('Sample city'));
    expect(json['status'], equals(true));
    expect(json['color'], equals('sample_color'));
    expect(json['created_at'], equals('2022-01-01T00:00:00.000'));
    expect(json['updated_at'], equals('2022-01-07T00:00:00.000'));
  });

  test('Supplier fromJson() should create a valid Supplier object', () {
    final json = {
      'id': 1,
      'name': 'Sample Supplier',
      'icon': 'sample_icon',
      'description': 'Sample description',
      'address': 'Sample address',
      'website': 'samplewebsite.com',
      'contact_email': 'sample@email.com',
      'contact_phone': '1234567890',
      'country': 'Sample country',
      'city': 'Sample city',
      'status': true,
      'color': 'sample_color',
      'created_at': '2022-01-01T00:00:00.000',
      'updated_at': '2022-01-07T00:00:00.000',
    };

    final supplier = Supplier.fromJson(json);

    expect(supplier.id, equals(1));
    expect(supplier.name, equals('Sample Supplier'));
    expect(supplier.icon, equals('sample_icon'));
    expect(supplier.description, equals('Sample description'));
    expect(supplier.address, equals('Sample address'));
    expect(supplier.website, equals('samplewebsite.com'));
    expect(supplier.contactEmail, equals('sample@email.com'));
    expect(supplier.contactPhone, equals('1234567890'));
    expect(supplier.country, equals('Sample country'));
    expect(supplier.city, equals('Sample city'));
    expect(supplier.status, equals(true));
    expect(supplier.color, equals('sample_color'));
    expect(supplier.createdAt, equals(DateTime(2022, 1, 1)));
    expect(supplier.updatedAt, equals(DateTime(2022, 1, 7)));
  });

  test('Supplier toString() should return a formatted string', () {
    final supplier = Supplier(
      id: 1,
      name: 'Sample Supplier',
      icon: 'sample_icon',
      description: 'Sample description',
      address: 'Sample address',
      website: 'samplewebsite.com',
      contactEmail: 'sample@email.com',
      contactPhone: '1234567890',
      country: 'Sample country',
      city: 'Sample city',
      status: true,
      color: 'sample_color',
      createdAt: DateTime(2022, 1, 1),
      updatedAt: DateTime(2022, 1, 7),
    );

    final string = supplier.toString();

    expect(
      string,
      equals(
        'Supplier{userId: 1, name: Sample Supplier, icon: sample_icon, description: Sample description, address: Sample address, website: samplewebsite.com, contactEmail: sample@email.com, contactPhone: 1234567890, country: Sample country, city: Sample city, status: true, color: sample_color, createdAt: 2022-01-01 00:00:00.000, updatedAt: 2022-01-07 00:00:00.000}',
      ),
    );
  });
}
