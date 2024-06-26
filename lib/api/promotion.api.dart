import 'dart:convert';
import 'package:clean_stock/core/domain/domain.dart';
import 'package:clean_stock/models/promotion.dart';
import 'package:http/http.dart' as http;

class PromotionAPI {
  static Future<List<Promotion>> getPromotions({required String token}) async {
    var url = domainPromotion;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> promotionJsonList = json.decode(response.body);
        final List<Promotion> promotions =
            promotionJsonList.map((json) => Promotion.fromJson(json)).toList();

        return promotions;
      } else {
        throw Exception('Failed to load promotions: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load promotions: $e');
    }
  }

  static Future<Promotion> getPromotion({
    required String id,
    required String token,
  }) async {
    final url = '$domainPromotion/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final promotionJson = json.decode(response.body);
        final Promotion promotion = Promotion.fromJson(promotionJson);

        return promotion;
      } else {
        throw Exception('Failed to load promotion: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load promotion: $e');
    }
  }

  static Future<Promotion> createPromotion({
    required Promotion promotion,
    required String token,
  }) async {
    var url = domainPromotion;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(promotion.toJson()),
      );

      if (response.statusCode == 201) {
        final promotionJson = json.decode(response.body);
        final Promotion promotion = Promotion.fromJson(promotionJson);

        return promotion;
      } else {
        throw Exception('Failed to create promotion: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to create promotion: $e');
    }
  }

  static Future<Promotion> updatePromotion({
    required Promotion promotion,
    required String token,
  }) async {
    final url = '$domainPromotion/${promotion.id}';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(promotion.toJson()),
      );

      if (response.statusCode == 200) {
        final promotionJson = json.decode(response.body);
        final Promotion promotion = Promotion.fromJson(promotionJson);

        return promotion;
      } else {
        throw Exception('Failed to update promotion: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to update promotion: $e');
    }
  }

  static Future<void> deletePromotion({
    required String id,
    required String token,
  }) async {
    final url = '$domainPromotion/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };

    try {
      final response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode != 204) {
        throw Exception('Failed to delete promotion: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to delete promotion: $e');
    }
  }
}
