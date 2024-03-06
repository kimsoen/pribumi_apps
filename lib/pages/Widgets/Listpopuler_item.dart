import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../theme.dart';

class ListPerumahan extends StatelessWidget {
  const ListPerumahan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/house1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perum antar samudra',
                  style: textPrimarystyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(height: 5),
                Text(
                  'jl mdw rt2 rw2 kel setia kec taman tasikmalaya',
                  style: secondarytextstyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
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
    );
  }
}
