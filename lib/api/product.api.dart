import 'dart:convert';

import 'package:clean_stock/core/domain/domain.dart';
import 'package:clean_stock/models/product.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  Future<List<Product>> getProducts({required String token}) async {
    const url = domainProduct;
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

  Future<Product> getProduct({
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

  Future<Product> createProduct({
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

  Future<Product> updateProduct({
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

  Future<void> deleteProduct({
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

  Future<List<Product>> getProductsByCategory({
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
