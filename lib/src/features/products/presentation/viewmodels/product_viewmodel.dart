import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../providers/product_provider.dart';

class ProductViewModel extends StateNotifier<AsyncValue<void>> {
  final ProductRepository _productRepository;

  ProductViewModel(this._productRepository)
    : super(const AsyncValue.data(null));

  Future<void> addProduct({
    required String name,
    required String storeId,
    required double price,
    String? description,
    List<XFile>? images,
  }) async {
    state = const AsyncValue.loading();
    try {
      final productId = const Uuid().v4();
      List<String> imageUrls = [];
      if (images != null && images.isNotEmpty) {
        imageUrls = await _productRepository.uploadProductImages(
          productId,
          images,
        );
      }
      final product = Product(
        id: productId,
        name: name,
        storeId: storeId,
        price: price,
        description: description,
        imageUrls: imageUrls,
      );
      await _productRepository.addProduct(product);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateProduct(Product product, List<XFile>? images) async {
    state = const AsyncValue.loading();
    try {
      List<String> imageUrls = product.imageUrls ?? [];
      if (images != null && images.isNotEmpty) {
        imageUrls.addAll(
          await _productRepository.uploadProductImages(product.id, images),
        );
      }
      await _productRepository.updateProduct(
        product.copyWith(imageUrls: imageUrls),
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteProduct(String productId) async {
    state = const AsyncValue.loading();
    try {
      await _productRepository.deleteProduct(productId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, AsyncValue<void>>((ref) {
      final productRepository = ref.watch(productRepositoryProvider);
      return ProductViewModel(productRepository);
    });
