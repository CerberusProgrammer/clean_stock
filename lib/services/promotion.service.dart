import 'package:clean_stock/api/promotion.api.dart';
import 'package:clean_stock/models/promotion.dart';

class PromotionService {
  static Future<List<Promotion>> getPromotions({required String token}) async {
    return await PromotionAPI.getPromotions(token: token);
  }

  static Future<Promotion> getPromotion({
    required String id,
    required String token,
  }) async {
    return await PromotionAPI.getPromotion(id: id, token: token);
  }

  static Future<Promotion> createPromotion({
    required Promotion promotion,
    required String token,
  }) async {
    return await PromotionAPI.createPromotion(
        promotion: promotion, token: token);
  }

  static Future<Promotion> updatePromotion({
    required Promotion promotion,
    required String token,
  }) async {
    return await PromotionAPI.updatePromotion(
        promotion: promotion, token: token);
  }

  static Future<void> deletePromotion({
    required String id,
    required String token,
  }) async {
    return await PromotionAPI.deletePromotion(id: id, token: token);
  }
}
