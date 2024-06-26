import 'package:clean_stock/models/promotion.dart';
import 'package:clean_stock/providers/user.riverpod.dart';
import 'package:clean_stock/services/promotion.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final promotionsProvider = FutureProvider<List<Promotion>>(
  (ref) async => PromotionService.getPromotions(
    token: ref.watch(userProvider).token,
  ),
);

final promotionProvider = FutureProvider.family<Promotion, String>(
  (ref, id) async => PromotionService.getPromotion(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);

final createPromotionProvider = FutureProvider.family<Promotion, Promotion>(
  (ref, promotion) async => PromotionService.createPromotion(
    promotion: promotion,
    token: ref.watch(userProvider).token,
  ),
);

final updatePromotionProvider = FutureProvider.family<Promotion, Promotion>(
  (ref, promotion) async => PromotionService.updatePromotion(
    promotion: promotion,
    token: ref.watch(userProvider).token,
  ),
);

final deletePromotionProvider = FutureProvider.family<void, String>(
  (ref, id) async => PromotionService.deletePromotion(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);
