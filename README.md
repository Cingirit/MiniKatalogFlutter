# Mini Katalog Uygulaması

Mini Katalog, Flutter ile hazırlanmış bir mobil ürün katalog uygulamasıdır. Ürünler uygulama içindeki statik örnek verilerden yüklenir; ürün arama, kategori filtreleme, ürün detayı ve sepet özellikleri sunar. Aynı ürün sepete tekrar eklendiğinde yeni bir satır oluşturmak yerine ürün adedi artırılır. Uygulama ayrıca kampanya duyurusu ve yerel ödeme adımı simülasyonu içerir.

## Özellikler

- Ana sayfada kampanya/indirim duyurusu ve öne çıkan ürünler
- Kategoriye göre ürün listeleme ve ürün adına göre arama
- Ürün detay ekranı ve sepete ekleme bildirimi
- Sepette ürün adetlerini birleştirme, seçilen adedi silme ve toplam tutarı hesaplama
- Ödeme özeti ve demo ödeme yöntemi seçimi
- Material 3 tema ve null safety
- Harici Flutter paketi kullanmadan, Material bileşenleriyle geliştirme

## Kullanılan teknoloji

- Flutter stable
- Dart 3 veya üzeri (pubspec SDK kısıtı: `>=3.0.0 <4.0.0`)
- Android emülatör veya Android cihaz

Bu çalışma ortamında Flutter/Dart SDK sürümü doğrulanamadığı için README’de belirli bir yama sürümü belirtilmemiştir.

## Kurulum ve çalıştırma

1. Flutter stable SDK'yı kurun ve Android emülatörünüzü veya cihazınızı hazırlayın.
2. Proje kök dizininde bağımlılıkları alın:

   ```bash
   flutter pub get
   ```

3. Uygulamayı başlatın:

   ```bash
   flutter run
   ```

Android cihazı/emülatörü seçmek için gerekirse `flutter devices` komutunu kullanın.

## Proje yapısı

```text
lib/
├── main.dart
├── data/
│   └── mock_products.dart       # Yerel, statik katalog verileri
├── models/
│   ├── product.dart             # Ürün modeli ve JSON dönüşümleri
│   └── cart_item.dart           # Sepet ürünü ve miktarı
├── screens/
│   ├── home_screen.dart         # Ana sayfa, kategori kısayolları ve öne çıkanlar
│   ├── product_list_screen.dart # Arama, kategori filtresi ve ürün ızgarası
│   ├── product_detail_screen.dart
│   ├── cart_screen.dart
│   └── checkout_screen.dart     # Demo ödeme adımı
├── widgets/
│   ├── banner_widget.dart       # Kampanya duyurusu
│   └── product_card.dart        # Ürün kartı ve hızlı işlemler
└── utils/
    ├── app_theme.dart           # Material 3 tema ayarları
    └── app_feedback.dart        # Sepete ekleme bildirimi
```

## Ürünleri ve kampanyayı düzenleme

- Ürün kataloğu `lib/data/mock_products.dart` içindeki `mockProductJson` listesinden gelir. Yeni ürün eklerken `id`, `name`, `description`, `price`, `imageUrl` ve `category` alanlarını tanımlayın.
- Ana sayfadaki kampanya başlığı, metni ve etiketi `lib/screens/home_screen.dart` dosyasındaki `BannerWidget` parametrelerinden değiştirilebilir.
- Ödeme ekranı eğitim amaçlı bir simülasyondur; gerçek ödeme işlemi yapmaz.

Ürün verileri ve sepet yerel olarak çalışır. Ürün fotoğrafları Picsum placeholder adreslerinden (`Image.network`) yüklenir; fotoğrafların görünmesi için internet bağlantısı gerekir.

## Ekran görüntüleri

### Ana Sayfa

_(Ekran görüntüsü eklenecek)_

### Ürün Listesi ve Detayı

_(Ekran görüntüsü eklenecek)_

### Sepet ve Ödeme

_(Ekran görüntüsü eklenecek)_
