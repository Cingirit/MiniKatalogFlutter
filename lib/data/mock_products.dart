import 'package:mini_katalog_app/models/product.dart';

/// Yerel JSON simülasyonu; ağ üzerinden ürün verisi alınmaz.
const List<Map<String, dynamic>> mockProductJson = [
  {'id': 1, 'name': 'Kablosuz Kulaklık', 'description': 'Gün boyu rahat kullanım sunan, net sesli kablosuz kulaklık.', 'price': 1299.90, 'imageUrl': 'https://picsum.photos/seed/1/400/400', 'category': 'Elektronik'},
  {'id': 2, 'name': 'Akıllı Saat', 'description': 'Günlük aktivitelerinizi ve bildirimlerinizi takip edin.', 'price': 2199.00, 'imageUrl': 'https://picsum.photos/seed/2/400/400', 'category': 'Elektronik'},
  {'id': 3, 'name': 'Bluetooth Hoparlör', 'description': 'Taşınabilir tasarımıyla güçlü ve dengeli ses.', 'price': 899.50, 'imageUrl': 'https://picsum.photos/seed/3/400/400', 'category': 'Elektronik'},
  {'id': 4, 'name': 'Pamuklu Tişört', 'description': 'Yumuşak pamuklu kumaştan günlük kullanım tişörtü.', 'price': 349.90, 'imageUrl': 'https://picsum.photos/seed/4/400/400', 'category': 'Giyim'},
  {'id': 5, 'name': 'Kapüşonlu Sweatshirt', 'description': 'Rahat kesimli, serin havalar için sıcak sweatshirt.', 'price': 749.00, 'imageUrl': 'https://picsum.photos/seed/5/400/400', 'category': 'Giyim'},
  {'id': 6, 'name': 'Kanvas Sırt Çantası', 'description': 'Günlük eşyalarınızı taşımanız için kullanışlı çanta.', 'price': 599.90, 'imageUrl': 'https://picsum.photos/seed/6/400/400', 'category': 'Aksesuar'},
  {'id': 7, 'name': 'Masa Lambası', 'description': 'Çalışma masanız için sade ve ayarlanabilir aydınlatma.', 'price': 489.00, 'imageUrl': 'https://picsum.photos/seed/7/400/400', 'category': 'Ev'},
  {'id': 8, 'name': 'Programlamaya Giriş', 'description': 'Temel programlama kavramlarını örneklerle anlatan kitap.', 'price': 279.90, 'imageUrl': 'https://picsum.photos/seed/8/400/400', 'category': 'Kitap'},
  {'id': 9, 'name': 'Minimalist Roman', 'description': 'Keyifle okuyabileceğiniz sürükleyici bir roman.', 'price': 189.50, 'imageUrl': 'https://picsum.photos/seed/9/400/400', 'category': 'Kitap'},
  {'id': 10, 'name': 'Güneş Gözlüğü', 'description': 'Zamansız tasarıma sahip hafif çerçeveli gözlük.', 'price': 649.00, 'imageUrl': 'https://picsum.photos/seed/10/400/400', 'category': 'Aksesuar'},
  {'id': 11, 'name': 'Çelik Su Şişesi', 'description': 'İçeceklerinizi yanınızda taşımanız için tekrar kullanılabilir şişe.', 'price': 329.00, 'imageUrl': 'https://picsum.photos/seed/11/400/400', 'category': 'Ev'},
  {'id': 12, 'name': 'Mekanik Klavye', 'description': 'Konforlu yazım hissi sunan kompakt mekanik klavye.', 'price': 1799.00, 'imageUrl': 'https://picsum.photos/seed/12/400/400', 'category': 'Elektronik'},
];

final List<Product> mockProducts = mockProductJson.map(Product.fromJson).toList();
