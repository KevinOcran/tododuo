import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tododuo/src/features/authentication/presentation/providers/auth_state_notifier.dart';
import 'package:tododuo/src/features/products/domain/entities/store.dart';
import 'package:tododuo/src/features/products/presentation/viewmodels/store_viewmodel.dart';

class CreateEditStoreScreen extends ConsumerStatefulWidget {
  final Store? store;

  const CreateEditStoreScreen({super.key, this.store});

  @override
  ConsumerState<CreateEditStoreScreen> createState() =>
      _CreateEditStoreScreenState();
}

class _CreateEditStoreScreenState extends ConsumerState<CreateEditStoreScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.store?.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.store?.description ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeViewModel = ref.read(storeViewModelProvider.notifier);
    final authState = ref.watch(authStateChangesProvider);

    ref.listen<AsyncValue<void>>(storeViewModelProvider, (_, state) {
      if (!state.isLoading && state.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${state.error}')));
      } else if (!state.isLoading && !state.hasError) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store == null ? 'Create Store' : 'Edit Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    final user = authState.asData!.value;

                    if (user != null) {
                      if (widget.store == null) {
                        storeViewModel.createStore(
                          name: name,
                          sellerId: user.uid,
                          description: description,
                        );
                      } else {
                        final updatedStore = widget.store!.copyWith(
                          name: name,
                          description: description,
                        );
                        storeViewModel.updateStore(updatedStore);
                      }
                    }
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
