import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/misc/methods.dart';
import 'package:pribumi_apps/pages/widgets/residential_grid_card.dart';
import 'package:pribumi_apps/providers/address_provider.dart';
import 'package:pribumi_apps/providers/residential_provider.dart';
import 'package:pribumi_apps/theme.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.only(right: 8.0),
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Location",
                    style: textPrimarystyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmarks_outlined),
              ),
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
                    loading: () => const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                  )
            ],
          ),
          verticalSpace(20),
          SearchField(
            onChanged: (value) {
              ref.watch(residentialProvider.notifier).filterResidentials(value);
            },
          ),
          verticalSpace(20),
        ],
      );
    }

    Widget gridViewDistanceResidential() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perumahan Terdekat',
            style: textPrimarystyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ref.watch(residentialProvider).when(
                data: (data) => GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.74,
                    crossAxisSpacing: 15,
                  ),
                  children: data
                      .map(
                        (e) => ResidentialGridCard(
                          residential: e,
                        ),
                      )
                      .toList() // kode untuk mengurutkan dari jarak terdekat ke jarak terjauh
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
            gridViewDistanceResidential(),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.25,
        decoration: BoxDecoration(
            color: const Color(0x1F29292E),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Iconsax.filter),
            hintText: 'Cari rumah impian anda',
            hintStyle: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
