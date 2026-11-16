import 'package:flutter/material.dart';
import 'package:mini_katalog_app/models/cart_item.dart';

/// Yerel demo ödeme adımı; gerçek bir ödeme sağlayıcısına bağlanmaz.
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.cart,
    required this.onOrderCompleted,
  });

  final List<CartItem> cart;
  final VoidCallback onOrderCompleted;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _paymentMethod = 'Kredi / banka kartı';

  @override
  Widget build(BuildContext context) {
    final total = widget.cart.fold<double>(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Ödeme Adımı')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Sipariş Özeti', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...widget.cart.map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(item.product.name),
              subtitle: Text('${item.quantity} adet • ${item.product.category}'),
              trailing: Text(
                '${(item.product.price * item.quantity).toStringAsFixed(2)} ₺',
              ),
            ),
          ),
          const Divider(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ödenecek Tutar',
                  style: Theme.of(context).textTheme.titleMedium),
              Text(
                '${total.toStringAsFixed(2)} ₺',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Ödeme Yöntemi',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _paymentMethod,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(
                value: 'Kredi / banka kartı',
                child: Text('Kredi / banka kartı'),
              ),
              DropdownMenuItem(
                value: 'Kapıda ödeme',
                child: Text('Kapıda ödeme'),
              ),
            ],
            onChanged: (value) {
              if (value != null) setState(() => _paymentMethod = value);
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Bu ekran eğitim amaçlı ödeme simülasyonudur. Gerçek ödeme alınmaz.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: widget.onOrderCompleted,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Siparişi Tamamla'),
            ),
          ),
        ],
      ),
    );
  }
}
