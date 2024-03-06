import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme.dart';
import 'Widgets/listimage_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 260,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
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
                  color: const Color(0xEFD8D8DB),
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
                  color: const Color(0xEFD8D8DB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.book_rounded,
                      size: 22,
                      color: Colors.black,
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
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListImage(),
                  ListImage(),
                  ListImage(),
                  ListImage(),
                  ListImage(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Text(
              'Perum Anugrah indah',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            const Text(
              'J6RQ+4MC, Jl. Letjen Mashudi, RT.05/RW.02, Kersanagara, Kec. Cibeureum, Kab. Tasikmalaya, Jawa Barat 46196',
              maxLines: 2,
            ),
            const SizedBox(height: 7),
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
              'Akses',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            Row(
              children: [
                Icon(Icons.report_gmailerrorred_rounded, color: bgColor),
                const SizedBox(width: 8),
                Text(
                  '800 m ke jalan RAYA',
                  style: textPrimarystyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget miniMaps() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-7.3701444, 108.2391412),
            zoom: 14,
          ),
        ),
      );
    }

    Widget footer() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'On The Way ',
                    style: textPrimarystyle.copyWith(
                        fontSize: 14, fontWeight: bold),
                  ),
                  const Icon(Icons.alt_route)
                ],
              ),
            ),
            Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.call_outlined),
                  Text(
                    'HUBUNGI',
                    style: textPrimarystyle.copyWith(
                        fontSize: 14, fontWeight: bold),
                  ),
                ],
              ),
            ),
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
            miniMaps(),
            footer(),
          ],
        ),
      ),
    );
  }
}
