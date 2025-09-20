import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/authentication/presentation/providers/auth_state_notifier.dart';

class SellerDispatchHomeScreen extends ConsumerWidget {
  const SellerDispatchHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller (Dispatch) Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authStateNotifierProvider.notifier).signOut();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome, Seller of Dispatch Services!'),
      ),
    );
  }
}
