import 'package:mini_katalog_app/models/product.dart';

/// Sepetteki ürünü ve aynı üründen eklenen adet sayısını tutar.
class CartItem {
  CartItem({required this.product, this.quantity = 1});

  final Product product;
  int quantity;
}
