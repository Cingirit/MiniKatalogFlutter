import 'package:flutter/material.dart';

/// Sepete ekleme bilgisini ekranın üst kısmında MaterialBanner olarak gösterir.
void showAddedToCartBanner(BuildContext context) {
  final messenger = ScaffoldMessenger.of(context);
  messenger
    ..hideCurrentMaterialBanner()
    ..showMaterialBanner(
      MaterialBanner(
        content: const Text('Ürün sepete eklendi'),
        leading: const Icon(Icons.check_circle_outline),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [
          TextButton(
            onPressed: messenger.hideCurrentMaterialBanner,
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
}
