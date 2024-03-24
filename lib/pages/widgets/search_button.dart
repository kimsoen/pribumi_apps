import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/pages/search_page.dart';

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
