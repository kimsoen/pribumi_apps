import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pribumi_apps/misc/methods.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/pages/widgets/image_item.dart';
import 'package:pribumi_apps/providers/residential_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class DetailPage extends StatefulWidget {
  final ResidentialModel residential;
  const DetailPage({super.key, required this.residential});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BitmapDescriptor mapIcons = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    custumMarker();
    super.initState();
  }

  void custumMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/marker.png')
        .then((value) {
      setState(() {
        mapIcons = value;
      });
    });
  }

  Future<void> goToMap(String url) async {
    final linkUrl = url;
    try {
      if (await canLaunch(linkUrl)) {
        await launch(
          url,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> _marker = [
      Marker(
          markerId: const MarkerId('value'),
          position: LatLng(
              widget.residential.latitude!, widget.residential.longitude!),
          icon: mapIcons),
    ];

    Widget header() {
      return CachedNetworkImage(
        imageUrl: widget.residential.image ?? '',
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
                children: widget.residential.photos!
                    .map((url) => ImageItem(url: url as String))
                    .toList(),
              ),
            ),
            verticalSpace(10),
            const Divider(),
            Text(
              widget.residential.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textPrimarystyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            Text(
              widget.residential.address ?? '',
              maxLines: 2,
            ),
            verticalSpace(7),
            Text(
              'Deskripsi',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            verticalSpace(5),
            Text(widget.residential.description ?? ''),
            verticalSpace(7),
            Text(
              'Type',
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            ...widget.residential.access!.map((e) {
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Lokasi",
              style:
                  textPrimarystyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: GoogleMap(
              markers: _marker.toSet(),
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.residential.latitude!,
                    widget.residential.longitude!),
                zoom: 15,
              ),
            ),
          ),
        ],
      );
    }

    Widget footer() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: bgColor),
            onPressed: () async {
              await goToMap('https://maps.app.goo.gl/3ZLNnSNTYAhE6cfM8');
            },
            child: const Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        'RUTE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.rocket_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                )
              ],
            )),
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
