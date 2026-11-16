import 'package:flutter/material.dart';
import 'package:mini_katalog_app/models/cart_item.dart';
import 'package:mini_katalog_app/models/product.dart';
import 'package:mini_katalog_app/screens/cart_screen.dart';
import 'package:mini_katalog_app/screens/checkout_screen.dart';
import 'package:mini_katalog_app/screens/home_screen.dart';
import 'package:mini_katalog_app/screens/product_detail_screen.dart';
import 'package:mini_katalog_app/screens/product_list_screen.dart';
import 'package:mini_katalog_app/utils/app_theme.dart';

void main() => runApp(const MiniKatalogApp());

/// Sepet durumunu uygulama boyunca tek noktadan yönetir.
class MiniKatalogApp extends StatefulWidget {
  const MiniKatalogApp({super.key});

  @override
  State<MiniKatalogApp> createState() => _MiniKatalogAppState();
}

class _MiniKatalogAppState extends State<MiniKatalogApp> {
  final List<CartItem> _cart = [];
  // Bu State'in context'i MaterialApp'in üzerinde kaldığı için
  // yönlendirmelerde Navigator'a doğrudan bu anahtarla erişilir.
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _addToCart(Product product) {
    setState(() {
      final itemIndex = _cart.indexWhere((item) => item.product.id == product.id);
      if (itemIndex == -1) {
        _cart.add(CartItem(product: product));
      } else {
        _cart[itemIndex].quantity++;
      }
    });
  }

  void _clearCart() => setState(_cart.clear);

  void _removeFromCart(int index, int quantity) {
    if (index < 0 || index >= _cart.length) return;
    setState(() {
      final item = _cart[index];
      item.quantity -= quantity;
      if (item.quantity <= 0) _cart.removeAt(index);
    });
  }

  void _openCart() {
    _navigatorKey.currentState!.push(MaterialPageRoute<void>(
      builder: (_) => CartScreen(
        cart: _cart,
        onProceedToCheckout: _openCheckout,
        onRemoveFromCart: _removeFromCart,
      ),
    ));
  }

  void _openCheckout() {
    _navigatorKey.currentState!.push(MaterialPageRoute<void>(
      builder: (_) => CheckoutScreen(
        cart: _cart,
        onOrderCompleted: () {
          _clearCart();
          _navigatorKey.currentState!.popUntil((route) => route.isFirst);
          final context = _navigatorKey.currentContext;
          if (context != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Siparişiniz alındı')),
            );
          }
        },
      ),
    ));
  }

  void _openProduct(Product product) {
    _navigatorKey.currentState!.push(MaterialPageRoute<void>(
      builder: (_) => ProductDetailScreen(
        product: product,
        onAddToCart: () => _addToCart(product),
      ),
    ));
  }

  void _openProductList([String? category]) {
    _navigatorKey.currentState!.push(MaterialPageRoute<void>(
      builder: (_) => ProductListScreen(
        onProductTap: _openProduct,
        onAddToCart: _addToCart,
        initialCategory: category,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mini Katalog',
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        theme: AppTheme.lightTheme,
        home: HomeScreen(
          cartCount: _cart.fold<int>(0, (sum, item) => sum + item.quantity),
          onOpenCart: _openCart,
          onOpenProduct: _openProduct,
          onOpenProductList: _openProductList,
          onAddToCart: _addToCart,
        ),
      );
}
