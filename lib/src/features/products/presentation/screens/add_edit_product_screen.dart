import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tododuo/src/features/products/domain/entities/product.dart';
import 'package:tododuo/src/features/products/presentation/viewmodels/product_viewmodel.dart';

class AddEditProductScreen extends ConsumerStatefulWidget {
  final Product? product;
  final String storeId;

  const AddEditProductScreen({super.key, this.product, required this.storeId});

  @override
  ConsumerState<AddEditProductScreen> createState() =>
      _AddEditProductScreenState();
}

class _AddEditProductScreenState extends ConsumerState<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  final List<XFile> _images = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
  }

  Future<void> _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    setState(() {
      _images.addAll(pickedImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel = ref.read(productViewModelProvider.notifier);

    ref.listen<AsyncValue<void>>(productViewModelProvider, (_, state) {
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
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
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
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text('Pick Images'),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Image.file(File(_images[index].path));
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    final price = double.parse(_priceController.text);

                    if (widget.product == null) {
                      productViewModel.addProduct(
                        name: name,
                        storeId: widget.storeId,
                        price: price,
                        description: description,
                        images: _images,
                      );
                    } else {
                      final updatedProduct = widget.product!.copyWith(
                        name: name,
                        description: description,
                        price: price,
                      );
                      productViewModel.updateProduct(updatedProduct, _images);
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
