import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/services/location_service.dart';
import 'package:pribumi_apps/services/residential_service.dart';
import 'package:pribumi_apps/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ResidentialModel> residentials = [];
  List<ResidentialModel> foundResidentials = [];
  bool isLoading = true;

  getListResidential() async {
    setState(() {
      isLoading = true;
    });

    residentials = await ResidentialService.listWithDistance();

    foundResidentials = residentials;

    setState(() {
      isLoading = false;
    });
  }

  void filterResidentials(String nameResidential) {
    // Create result variable
    List<ResidentialModel> result = [];

    // Condition nameResidential is empety
    if (nameResidential.isEmpty) {
      setState(() {
        result = residentials;
      });

      // Condition nameResidential not empety
    } else {
      setState(() {
        result = residentials
            .where(
              (element) => element.name.toString().toLowerCase().contains(
                    nameResidential.toLowerCase(),
                  ),
            )
            .toList();
      });
    }

    setState(() {
      foundResidentials = result;
    });
  }

  @override
  void initState() {
    Future.microtask(() => getListResidential());
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
          const SizedBox(height: 20),
          SearchField(
            onChanged: (value) {
              filterResidentials(value);
            },
          ),
          const SizedBox(height: 20),
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
          (isLoading == false)
              ? GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 15,
                  ),
                  children: foundResidentials
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
                )
              : const Center(
                  child: CircularProgressIndicator(),
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
              hintStyle: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}

class ResidentialGridCard extends StatelessWidget {
  const ResidentialGridCard({
    super.key,
    required this.residential,
  });

  final ResidentialModel residential;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(residential.images ?? 'assets/house1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 5,
          ),
          child: Text(
            'Jarak ${residential.distance!.toStringAsFixed(0)} Km',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(residential.name ?? ''),
        ),
      ],
    );
  }
}
