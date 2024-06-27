import 'dart:convert';

import 'package:clean_stock/core/domain/domain.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/products/product.query.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  static Future<List<Product>> getProducts({
    required String token,
    required ProductQueryParams queryParams,
  }) async {
    var params = <String, String>{};

    if (queryParams.name != null) params['name'] = queryParams.name!;
    if (queryParams.description != null) {
      params['description'] = queryParams.description!;
    }
    if (queryParams.barcode != null) params['barcode'] = queryParams.barcode!;
    if (queryParams.weight != null) {
      params['weight'] = queryParams.weight.toString();
    }
    if (queryParams.dimension != null) {
      params['dimension'] = queryParams.dimension!;
    }
    if (queryParams.expirationDate != null) {
      params['expiration_date'] = queryParams.expirationDate!;
    }
    if (queryParams.location != null) {
      params['location'] = queryParams.location!;
    }
    if (queryParams.manufacturer != null) {
      params['manufacturer'] = queryParams.manufacturer!;
    }
    if (queryParams.supplier != null) {
      params['supplier'] = queryParams.supplier!;
    }
    if (queryParams.status != null) {
      params['status'] = queryParams.status.toString();
    }
    if (queryParams.price != null) {
      params['price'] = queryParams.price.toString();
    }
    if (queryParams.quantity != null) {
      params['quantity'] = queryParams.quantity.toString();
    }
    if (queryParams.category != null) {
      params['category'] = queryParams.category!;
    }
    if (queryParams.createdAt != null) {
      params['created_at'] = queryParams.createdAt!;
    }

    final uri = Uri.parse(domainProduct).replace(queryParameters: params);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> productJsonList = json.decode(response.body);
        final List<Product> products =
            productJsonList.map((json) => Product.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to load products: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  static Future<Product> getProduct({
    required String id,
    required String token,
  }) async {
    final url = '$domainProduct/$id';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final productJson = json.decode(response.body);
        final Product product = Product.fromJson(productJson);

        return product;
      } else {
        throw Exception('Failed to load product: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }

  static Future<Product> createProduct({
    required Product product,
    required String token,
  }) async {
    const url = domainProduct;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 201) {
        final productJson = json.decode(response.body);
        final Product product = Product.fromJson(productJson);

        return product;
      } else {
        throw Exception('Failed to create product: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }
  }

  static Future<Product> updateProduct({
    required Product product,
    required String token,
  }) async {
    final url = '$domainProduct/${product.id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(product.toJson()),
      );

      if (response.statusCode == 200) {
        final productJson = json.decode(response.body);
        final Product product = Product.fromJson(productJson);

        return product;
      } else {
        throw Exception('Failed to update product: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  static Future<void> deleteProduct({
    required String id,
    required String token,
  }) async {
    final url = '$domainProduct/$id';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode != 204) {
        throw Exception('Failed to delete product: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  static Future<List<Product>> getProductsByCategory({
    required String categoryId,
    required String token,
  }) async {
    final url = '$domainProduct?category=$categoryId';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> productJsonList = json.decode(response.body);
        final List<Product> products =
            productJsonList.map((json) => Product.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to load products: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
