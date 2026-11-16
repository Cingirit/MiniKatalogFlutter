import 'package:flutter/material.dart';
import 'package:mini_katalog_app/data/mock_products.dart';
import 'package:mini_katalog_app/models/product.dart';
import 'package:mini_katalog_app/widgets/banner_widget.dart';
import 'package:mini_katalog_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.cartCount, required this.onOpenCart, required this.onOpenProduct, required this.onOpenProductList, required this.onAddToCart});

  final int cartCount;
  final VoidCallback onOpenCart;
  final ValueChanged<Product> onOpenProduct;
  final ValueChanged<String?> onOpenProductList;
  final ValueChanged<Product> onAddToCart;

  @override
  Widget build(BuildContext context) {
    final categories = mockProducts.map((p) => p.category).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        actions: [
          IconButton(
            tooltip: 'Sepetim',
            onPressed: onOpenCart,
            icon: Badge(isLabelVisible: cartCount > 0, label: Text('$cartCount'), child: const Icon(Icons.shopping_cart_outlined)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const BannerWidget(
          label: 'SINIRLI SÜRELİ KAMPANYA',
          title: 'Özel Gün İndirimi',
          description: 'Seçili ürünlerde %20’ye varan indirim fırsatları.',
        ),
        const SizedBox(height: 24),
        Text('Kategoriler', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) => ActionChip(
              label: Text(categories[index]),
              onPressed: () => onOpenProductList(categories[index]),
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text('Öne Çıkan Ürünler', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        SizedBox(
          height: 275,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mockProducts.take(5).length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) => SizedBox(
              width: 190,
              child: ProductCard(
                product: mockProducts[index],
                onTap: () => onOpenProduct(mockProducts[index]),
                onAddToCart: () => onAddToCart(mockProducts[index]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(onPressed: () => onOpenProductList(null), icon: const Icon(Icons.grid_view), label: const Text('Tüm Ürünler')),
      ]),
    );
  }
}
