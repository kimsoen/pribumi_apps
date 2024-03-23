import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/data/data_resedential.dart';
import 'package:pribumi_apps/pages/search_page.dart';
import 'package:pribumi_apps/services/location_service.dart';
import 'package:pribumi_apps/services/residential_service.dart';
import 'package:pribumi_apps/theme.dart';
import 'widgets/residential_tile.dart';
import 'widgets/residential_card.dart';

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
          const SarchButton(),
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
          // FutureBuilder(future: Database.getData(), builder: (context, snapshot) {

          // },)
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

class SarchButton extends StatelessWidget {
  const SarchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
      },
      child: Center(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.25,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              color: const Color(0x1F29292E),
              borderRadius: BorderRadius.circular(10)),
          child: const Row(
            children: [
              Icon(Icons.search),
              SizedBox(
                width: 10.0,
              ),
              Expanded(child: Text('Cari rumah impian anda')),
              Icon(Iconsax.filter)
            ],
          ),
        ),
      ),
    );
  }
}
