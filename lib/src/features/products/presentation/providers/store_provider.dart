import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/products/data/repositories/store_repository_impl.dart';

import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  return StoreRepositoryImpl(FirebaseFirestore.instance);
});

final storeProvider = FutureProvider.autoDispose.family<Store?, String>((
  ref,
  sellerId,
) {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return storeRepository.getStoreBySellerId(sellerId);
});
