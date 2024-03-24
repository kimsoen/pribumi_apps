import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/misc/methods.dart';
import 'package:pribumi_apps/pages/widgets/search_button.dart';
import 'package:pribumi_apps/providers/address_provider.dart';
import 'package:pribumi_apps/providers/residential_provider.dart';
import 'package:pribumi_apps/services/location_service.dart';
import 'package:pribumi_apps/theme.dart';
import 'package:shimmer/shimmer.dart';
import 'widgets/residential_tile.dart';
import 'widgets/residential_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
              ref.watch(addressProvider).when(
                    data: (data) => Flexible(
                      child: Text(
                        data,
                        style: textPrimarystyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    error: (error, stackTrace) => Flexible(
                      child: Text(
                        'alamat tidak ditemukan',
                        style: textPrimarystyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    loading: () => Text(
                      '.....',
                      style: textPrimarystyle.copyWith(
                          fontSize: 13, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
            ],
          ),
          verticalSpace(15),
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
          verticalSpace(8),
          const SarchButton(),
          verticalSpace(20),
        ],
      );
    }

    Widget shimmerLoading() {
      return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.grey.withOpacity(0.6),
        period: const Duration(seconds: 2),
        direction: ShimmerDirection.rtl,
        child: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          ),
        ),
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
          verticalSpace(10),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ref.watch(residentialProvider).when(
                    data: (data) => Row(
                      children: data
                          .map(
                            (e) => ResidentialCard(residential: e),
                          )
                          .toList()
                        // kode untuk mengurutkan dari jarak terdekat ke jarak terjauh
                        ..sort(
                          ((a, b) => a.residential.distance!
                              .compareTo(b.residential.distance!)),
                        ),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )),
          verticalSpace(20)
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
          verticalSpace(10),
          ref.watch(residentialProvider).when(
                data: (data) => Column(
                  children: data
                      .map(
                        (e) => ResidentialTile(
                          residential: e,
                        ),
                      )
                      .toList(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
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
            // shimmerLoading(),
            content(),
          ],
        ),
      ),
    );
  }
}
