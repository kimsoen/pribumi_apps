import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/data/data_resedential.dart';
import 'package:pribumi_apps/services/location_service.dart';
import 'package:pribumi_apps/services/residential_service.dart';
import 'package:pribumi_apps/theme.dart';
import 'widgets/list_populer_item.dart';
import 'widgets/list_content_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => LocationService.chekPermission(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location",
                style: textPrimarystyle.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.notification)),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.green[800],
                size: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              FutureBuilder(
                future: LocationService.getAddress(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Flexible(
                      child: Text(
                        snapshot.data!,
                        style: textPrimarystyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  } else {
                    return Flexible(
                      child: Text(
                        'alamat tidak ditemukan',
                        style: textPrimarystyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }
                },
              )
            ],
          ),
          const SizedBox(height: 15),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Find a\nplace like ',
                    style: textPrimarystyle.copyWith(
                        fontSize: 20, fontWeight: semiBold)),
                TextSpan(
                  text: 'Your Dream',
                  style: textPrimarystyle.copyWith(
                      fontSize: 20, color: Colors.blue[400], fontWeight: bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.25,
              decoration: BoxDecoration(
                  color: const Color(0x1F29292E),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Iconsax.filter),
                    hintText: 'Cari rumah impian anda',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    Widget nearby() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nearby',
            style: textPrimarystyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: ResidentialService.listWithDistance(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    children: snapshot.data!
                        .map(
                          (e) => ResidentialCard(residential: e),
                        )
                        .toList()
                      // kode untuk mengurutkan dari jarak terdekat ke jarak terjauh
                      ..sort(
                        ((a, b) => a.residential.distance!
                            .compareTo(b.residential.distance!)),
                      ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20)
        ],
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'List Perumahan',
            style: textPrimarystyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: DataResidential.listResedential
                .map((e) => const ResidentialTile())
                .toList(),
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            header(),
            nearby(),
            content(),
          ],
        ),
      ),
    );
  }
}
