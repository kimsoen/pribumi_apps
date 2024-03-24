import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/misc/methods.dart';
import 'package:pribumi_apps/models/residential_model.dart';
import 'package:pribumi_apps/pages/detail_page.dart';

import '../../theme.dart';

class ResidentialTile extends StatelessWidget {
  const ResidentialTile({
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: residential.image ?? '',
              imageBuilder: (context, imageProvider) => Container(
                margin: const EdgeInsets.only(right: 10),
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const SizedBox(
                height: 75,
                width: 75,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => const SizedBox(
                height: 75,
                width: 75,
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    residential.name ?? '',
                    style: textPrimarystyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(5),
                  Text(
                    residential.address ?? '',
                    style: secondarytextstyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Iconsax.discount_shape),
                      Icon(Icons.bathtub_rounded),
                      Icon(Icons.home_work_outlined),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
