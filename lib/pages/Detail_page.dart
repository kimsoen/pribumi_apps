import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 260,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            image: DecorationImage(
                image: AssetImage('assets/house1.png'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xAB6B6B6D),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    )),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xAB6B6B6D),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.book_outlined,
                      size: 22,
                      color: Colors.yellow,
                    )),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perum Anugrah indahnyoo',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            const Text('jl. letnan  no.98'),
            const SizedBox(height: 7),
            Container(
              height: 132,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(-7.3701444, 108.2391412),
                  zoom: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 5),
            const Text(
                'An exclusive enclave of luxurious homes along a tranquil river. Meticulously designed, each estate offers modern amenities, panoramic views, and the epitome of refined living.'),
            const SizedBox(height: 7),
            Text(
              'Fasilitas',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Row(
              children: [
                Icon(Icons.done_outline, color: Colors.green),
                Text(
                  '83 m2 luas tanah',
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
