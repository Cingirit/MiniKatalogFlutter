import 'package:flutter/material.dart';
import 'package:mini_katalog_app/models/product.dart';
import 'package:mini_katalog_app/utils/app_feedback.dart';

/// Grid ve yatay ürün listelerinde kullanılan tekrar kullanılabilir kart.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap, required this.onAddToCart});

  final Product product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image_not_supported_outlined, size: 42)),
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text('${product.price.toStringAsFixed(2)} ₺', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  IconButton.filledTonal(
                    tooltip: 'Detay',
                    onPressed: onTap,
                    icon: const Icon(Icons.visibility_outlined),
                  ),
                  IconButton.filled(
                    tooltip: 'Sepete ekle',
                    onPressed: () {
                      onAddToCart();
                      showAddedToCartBanner(context);
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                ]),
              ]),
            ),
          ]),
        ),
      );
}
