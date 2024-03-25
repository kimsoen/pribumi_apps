import 'package:flutter/material.dart';
import 'package:pribumi_apps/theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PRIBUMI APP",
                style:
                    textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Pribumi app adalah sebuah aplikasi yang memberikan Informasi tentang perumahan yang ada di Kota Tasikmalaya, dan memanfaatkan formula Haversine untuk mencari lokasi terdekat berdasarkan jarak geografis.",
                style: textPrimarystyle.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Sumber Asset",
                style:
                    textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'sumber asset yang saya gunakan dalam aplikasi pribumi app yaitu ',
                      style: textPrimarystyle.copyWith(fontSize: 14),
                    ),
                    TextSpan(
                      text: 'Figma, Dinas Perwaskim, Google maps, kurdiman',
                      style: textPrimarystyle.copyWith(
                          fontSize: 14, color: bgColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
