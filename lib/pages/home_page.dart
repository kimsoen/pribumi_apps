import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/pages/Detail_page.dart';
import 'package:pribumi_apps/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: textPrimarystyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green[800],
                        size: 20,
                      ),
                      Text(
                        'Your location',
                        style: textPrimarystyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                      )
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.notification)),
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
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.25,
              decoration: BoxDecoration(
                  color: const Color(0x1F29292E),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
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
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ListContent(),
                SizedBox(width: 10),
                ListContent(),
              ],
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
          const listPopuler(),
          const listPopuler(),
          const listPopuler(),
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

class listPopuler extends StatelessWidget {
  const listPopuler({
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
        margin: const EdgeInsets.only(top: 10),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0x1F29292E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 75,
              width: 75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/house.png',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perum bumi karsanagara',
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: textPrimarystyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Kahuripan, Kec. Tawang, Tasikmalaya,',
                    style: secondarytextstyle.copyWith(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Icon(
                  //       Icons.bathtub_outlined,
                  //     ),
                  //     Icon(
                  //       Icons.garage_outlined,
                  //     ),
                  //     Icon(
                  //       Icons.account_tree_outlined,
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListContent extends StatelessWidget {
  const ListContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perumahan Pelangi Residence',
                  style: textPrimarystyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                ),
                Text(
                  'J6RQ+4MC, Jl. Letjen Mashudi, RT.05/RW.02, Kersanagara, Kec. Cibeureum, Kab. Tasikmalaya, Jawa Barat 46196',
                  style: secondarytextstyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Image(
                //       image: AssetImage(
                //         'assets/kasur.png',
                //       ),
                //       width: 20,
                //     ),
                //     Image(
                //       image: AssetImage(
                //         'assets/Wifi.png',
                //       ),
                //       width: 20,
                //     ),
                //     Image(
                //       image: AssetImage(
                //         'assets/Bath.png',
                //       ),
                //       width: 20,
                //     ),
                //     Image(
                //       image: AssetImage(
                //         'assets/garage.png',
                //       ),
                //       width: 20,
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
