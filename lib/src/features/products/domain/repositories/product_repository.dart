import 'package:image_picker/image_picker.dart';

import '../entities/product.dart';

abstract class ProductRepository {
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String productId);
  Stream<List<Product>> getProductsByStoreId(String storeId);
  Future<List<String>> uploadProductImages(
    String productId,
    List<XFile> images,
  );
}
