import 'package:flutter/material.dart';
import 'package:pribumi_apps/models/residential_model.dart';

import '../../theme.dart';
import '../detail_page.dart';

class ResidentialCard extends StatelessWidget {
  const ResidentialCard({
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
              builder: (context) => const DetailPage(),
            ));
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width / 1.2,
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
            color: const Color(0x1F29292E),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      residential.images ?? '',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    residential.name ?? '',
                    style: textPrimarystyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    residential.address ?? '',
                    style: secondarytextstyle.copyWith(
                        fontSize: 12, fontWeight: regular),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.route_outlined, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            'Jarak ${residential.distance!.toStringAsFixed(0)} Km',
                            style: secondarytextstyle.copyWith(),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.pool_rounded, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            'NO',
                            style: secondarytextstyle.copyWith(),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.garage_outlined, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            'YES',
                            style: secondarytextstyle.copyWith(),
                          )
                        ],
                      )
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
