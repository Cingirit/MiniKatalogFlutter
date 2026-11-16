import 'package:flutter/material.dart';

/// Ana sayfada güncellenebilir kampanya bilgisini gösteren gradient banner.
class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.title,
    required this.description,
    required this.label,
  });

  final String title;
  final String description;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xFF3F51B5), Color(0xFF7986CB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.local_offer_outlined, color: Colors.white, size: 34),
            SizedBox(height: 14),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.1)),
            SizedBox(height: 6),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(description, style: TextStyle(color: Colors.white70, fontSize: 15)),
          ],
        ),
      );
}
