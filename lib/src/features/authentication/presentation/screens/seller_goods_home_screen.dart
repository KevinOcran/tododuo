import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/authentication/presentation/providers/auth_state_notifier.dart';
import 'package:tododuo/src/features/products/presentation/providers/store_provider.dart';
import 'package:tododuo/src/features/products/presentation/screens/create_edit_store_screen.dart';
import 'package:tododuo/src/features/products/presentation/screens/seller_dashboard_screen.dart';

class SellerGoodsHomeScreen extends ConsumerWidget {
  const SellerGoodsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller (Goods) Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authStateNotifierProvider.notifier).signOut();
            },
          ),
        ],
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('Please sign in.'));
          }
          final storeAsync = ref.watch(storeProvider(user.uid));
          return storeAsync.when(
            data: (store) {
              if (store != null) {
                return SellerDashboardScreen(storeId: store.id);
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You don\'t have a store yet.'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreateEditStoreScreen(),
                            ),
                          );
                        },
                        child: const Text('Create a Store'),
                      ),
                    ],
                  ),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
