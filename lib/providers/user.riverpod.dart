import 'package:clean_stock/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider(
  (ref) => User(
    username: 'x',
    email: 'x@x.com',
    token: '3c6028f980a4297ecd386cb9cd21289da0ecb1de',
  ),
);
