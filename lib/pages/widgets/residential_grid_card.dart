import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/pages/detail_page.dart';

class ResidentialGridCard extends StatelessWidget {
  const ResidentialGridCard({
    super.key,
    required this.residential,
  });

  final ResidentialModel residential;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                residential: residential,
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: residential.image ?? '',
            imageBuilder: (context, imageProvider) => Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const SizedBox(
              height: 130,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 130,
              child: Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 5,
            ),
            child: Text(
              'Jarak ${residential.distance!.toStringAsFixed(0)} m',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(residential.name ?? ''),
          ),
        ],
      ),
    );
  }
}
