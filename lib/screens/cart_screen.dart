import 'package:flutter/material.dart';
import 'package:mini_katalog_app/models/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.cart, required this.onProceedToCheckout, required this.onRemoveFromCart});

  final List<CartItem> cart;
  final VoidCallback onProceedToCheckout;
  final void Function(int index, int quantity) onRemoveFromCart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final total = widget.cart.fold<double>(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Sepetim')),
      body: widget.cart.isEmpty
          ? const Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.shopping_cart_outlined, size: 72, color: Colors.grey),
                SizedBox(height: 12),
                Text('Sepetiniz boş', style: TextStyle(fontSize: 18)),
              ]),
            )
          : Column(children: [
              Expanded(
                child: ListView.separated(
                  itemCount: widget.cart.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = widget.cart[index];
                    final product = item.product;
                    return ListTile(
                      leading: CircleAvatar(child: Text('${item.quantity}x')),
                      title: Text(product.name),
                      subtitle: Text('${product.category} • ${item.quantity} adet'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${(product.price * item.quantity).toStringAsFixed(2)} ₺'),
                          IconButton.filledTonal(
                            style: IconButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.errorContainer,
                              foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
                            ),
                            tooltip: 'Ürünü sepetten kaldır',
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () async {
                              final quantityToRemove = await showDialog<int>(
                                context: context,
                                builder: (dialogContext) {
                                  var selectedQuantity = 1;
                                  return StatefulBuilder(
                                    builder: (context, setDialogState) =>
                                        AlertDialog(
                                      title: const Text('Silinecek miktar'),
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: selectedQuantity > 1
                                                ? () => setDialogState(() =>
                                                    selectedQuantity--)
                                                : null,
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text('$selectedQuantity / ${item.quantity}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium),
                                          IconButton(
                                            onPressed: selectedQuantity <
                                                    item.quantity
                                                ? () => setDialogState(() =>
                                                    selectedQuantity++)
                                                : null,
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(dialogContext),
                                          child: const Text('Vazgeç'),
                                        ),
                                        FilledButton.icon(
                                          onPressed: () => Navigator.pop(
                                              dialogContext, selectedQuantity),
                                          icon: const Icon(Icons.delete_outline),
                                          label: const Text('Seçilen miktarı sil'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (quantityToRemove != null && mounted) {
                                widget.onRemoveFromCart(index, quantityToRemove);
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Toplam', style: Theme.of(context).textTheme.titleLarge),
                      Text('${total.toStringAsFixed(2)} ₺', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ]),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: widget.onProceedToCheckout,
                        icon: const Icon(Icons.payment),
                        label: const Text('Ödeme Adımına Geç'),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
    );
  }
}
