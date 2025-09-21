import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/products/data/repositories/product_repository_impl.dart';
import 'package:tododuo/src/features/products/domain/entities/product.dart';
import 'package:tododuo/src/features/products/domain/repositories/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
  );
});

final productListProvider = StreamProvider.autoDispose
    .family<List<Product>, String>((ref, storeId) {
      final productRepository = ref.watch(productRepositoryProvider);
      return productRepository.getProductsByStoreId(storeId);
    });
