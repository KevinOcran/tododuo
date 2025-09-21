import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/products/presentation/screens/add_edit_product_screen.dart';
import 'package:tododuo/src/features/products/presentation/viewmodels/product_viewmodel.dart';

import '../providers/product_provider.dart';

class SellerDashboardScreen extends ConsumerWidget {
  final String storeId;

  const SellerDashboardScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider(storeId));
    final productViewModel = ref.read(productViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Seller Dashboard')),
      body: products.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text(product.description ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('\$${product.price.toStringAsFixed(2)}'),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddEditProductScreen(
                            storeId: storeId,
                            product: product,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      productViewModel.deleteProduct(product.id);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddEditProductScreen(storeId: storeId),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
