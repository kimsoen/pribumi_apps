import 'package:flutter/material.dart';

class ListImage extends StatelessWidget {
  const ListImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 85,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            image: AssetImage('assets/house.png'), fit: BoxFit.fill),
      ),
    );
  }
}
