import 'package:flutter/material.dart';
import 'package:mini_katalog_app/data/mock_products.dart';
import 'package:mini_katalog_app/models/product.dart';
import 'package:mini_katalog_app/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.onProductTap, required this.onAddToCart, this.initialCategory});

  final ValueChanged<Product> onProductTap;
  final ValueChanged<Product> onAddToCart;
  final String? initialCategory;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String _query = '';
  late String _category;

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory ?? 'Tümü';
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['Tümü', ...mockProducts.map((p) => p.category).toSet()];
    final products = mockProducts.where((product) {
      final matchesName = product.name.toLowerCase().contains(_query.toLowerCase());
      return matchesName && (_category == 'Tümü' || product.category == _category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Ürün ara',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          onChanged: (value) => setState(() => _query = value),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) => ChoiceChip(
              label: Text(categories[index]),
              selected: _category == categories[index],
              onSelected: (_) => setState(() => _category = categories[index]),
            ),
          ),
        ),
        Expanded(
          child: products.isEmpty
              ? const Center(child: Text('Aramanızla eşleşen ürün bulunamadı.'))
              : GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.63, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: products[index],
                    onTap: () => widget.onProductTap(products[index]),
                    onAddToCart: () => widget.onAddToCart(products[index]),
                  ),
                ),
        ),
      ]),
    );
  }
}
