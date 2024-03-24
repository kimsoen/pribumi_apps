import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/misc/methods.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/pages/widgets/image_item.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.residential});

  final ResidentialModel residential;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return CachedNetworkImage(
        imageUrl: residential.image ?? '',
        imageBuilder: (context, imageProvider) => Container(
          height: 260,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
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
        ),
        placeholder: (context, url) => const SizedBox(
          height: 260,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const SizedBox(
          height: 260,
          child: Center(
            child: Icon(Icons.error),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: residential.photos!
                    .map((url) => ImageItem(url: url as String))
                    .toList(),
              ),
            ),
            verticalSpace(10),
            const Divider(),
            Text(
              residential.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              residential.address ?? '',
              maxLines: 2,
            ),
            verticalSpace(7),
            Text(
              'Deskripsi',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            verticalSpace(5),
            Text(residential.description ?? ''),
            verticalSpace(7),
            Text(
              'Akses',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            ...residential.access!.map((e) {
              String access = e as String;
              bool isEmpty = access.isEmpty;
              return Row(
                children: [
                  Icon(Icons.report_gmailerrorred_rounded, color: bgColor),
                  horizontalSpace(8),
                  Text(
                    isEmpty == true ? '-' : access,
                    style: textPrimarystyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  )
                ],
              );
            }),
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
