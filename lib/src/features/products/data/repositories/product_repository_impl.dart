import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tododuo/src/features/products/domain/entities/product.dart';
import 'package:tododuo/src/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ProductRepositoryImpl(this._firestore, this._storage);

  @override
  Future<void> addProduct(Product product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .set(product.toJson());
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await _firestore.collection('products').doc(productId).delete();
  }

  @override
  Stream<List<Product>> getProductsByStoreId(String storeId) {
    return _firestore
        .collection('products')
        .where('storeId', isEqualTo: storeId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList(),
        );
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .update(product.toJson());
  }

  @override
  Future<List<String>> uploadProductImages(
    String productId,
    List<XFile> images,
  ) async {
    final List<String> imageUrls = [];
    for (final image in images) {
      final ref = _storage
          .ref()
          .child('product_images')
          .child(productId)
          .child(DateTime.now().toIso8601String());
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      imageUrls.add(url);
    }
    return imageUrls;
  }
}
