import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/products/domain/entities/store.dart';
import 'package:tododuo/src/features/products/domain/repositories/store_repository.dart';
import 'package:tododuo/src/features/products/presentation/providers/store_provider.dart';
import 'package:uuid/uuid.dart';

class StoreViewModel extends StateNotifier<AsyncValue<void>> {
  final StoreRepository _storeRepository;

  StoreViewModel(this._storeRepository) : super(const AsyncValue.data(null));

  Future<void> createStore({
    required String name,
    required String sellerId,
    String? description,
  }) async {
    state = const AsyncValue.loading();
    try {
      final store = Store(
        id: const Uuid().v4(),
        name: name,
        sellerId: sellerId,
        description: description,
      );
      await _storeRepository.createStore(store);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateStore(Store store) async {
    state = const AsyncValue.loading();
    try {
      await _storeRepository.updateStore(store);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final storeViewModelProvider =
    StateNotifierProvider<StoreViewModel, AsyncValue<void>>((ref) {
      final storeRepository = ref.watch(storeRepositoryProvider);
      return StoreViewModel(storeRepository);
    });
