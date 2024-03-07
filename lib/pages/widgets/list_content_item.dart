import 'package:flutter/material.dart';

import '../../theme.dart';
import '../detail_page.dart';

class ListContent extends StatelessWidget {
  const ListContent({
    super.key,
  });

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
        decoration: BoxDecoration(
            color: const Color(0x1F29292E),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/house1.png',
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
                    'Perumahan Pelangi Residence',
                    style: textPrimarystyle.copyWith(
                        fontSize: 17, fontWeight: semiBold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'J6RQ+4MC, Jl. Letjen Mashudi, RT.05/RW.02, Kersanagara, Kec. Cibeureum, Kab. Tasikmalaya, Jawa Barat 46196',
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
                            '100 M',
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
