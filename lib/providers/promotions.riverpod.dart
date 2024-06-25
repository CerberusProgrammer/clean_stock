import 'package:clean_stock/models/promotion.dart';
import 'package:clean_stock/services/promotion.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final promotionsProvider = FutureProvider<List<Promotion>>((ref) async {
  return PromotionService.getPromotions(token: '');
});

final promotionProvider =
    FutureProvider.family<Promotion, String>((ref, id) async {
  return PromotionService.getPromotion(id: id, token: '');
});

final createPromotionProvider =
    FutureProvider.family<Promotion, Promotion>((ref, promotion) async {
  return PromotionService.createPromotion(promotion: promotion, token: '');
});

final updatePromotionProvider =
    FutureProvider.family<Promotion, Promotion>((ref, promotion) async {
  return PromotionService.updatePromotion(promotion: promotion, token: '');
});

final deletePromotionProvider =
    FutureProvider.family<void, String>((ref, id) async {
  return PromotionService.deletePromotion(id: id, token: '');
});
