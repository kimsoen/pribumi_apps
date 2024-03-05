import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pribumi_apps/pages/info_page.dart';
import 'package:pribumi_apps/theme.dart';

import 'pages/home_page.dart';
import 'pages/maps_page.dart';
import 'pages/whaitlist_page.dart';

class NavBarpage extends StatefulWidget {
  const NavBarpage({super.key});

  @override
  State<NavBarpage> createState() => _NavBarpageState();
}

class _NavBarpageState extends State<NavBarpage> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    // int currentindex = 0;

    Widget pages() {
      switch (currentindex) {
        case 0:
          return const HomePage();
        case 1:
          return const MapPage();
        // case 2:
        //   return const WaitlistPage();
        case 2:
          return const infoPage();

        default:
          return const HomePage();
      }
    }

    Widget costumNavBar() {
      return NavigationBar(
          selectedIndex: currentindex,
          height: 60,
          elevation: 0,
          indicatorColor: Color(0x00670196),
          onDestinationSelected: (value) {
            setState(() {
              currentindex = value;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                  color: currentindex == 0 ? bgColor : bgColor2,
                ),
                label: ("")),
            NavigationDestination(
                icon: Icon(
                  Icons.map_outlined,
                  color: currentindex == 1 ? bgColor : bgColor2,
                ),
                label: ("")),
            // NavigationDestination(
            //     icon: Icon(
            //       Iconsax.heart,
            //       color: currentindex == 2 ? bgColor : bgColor2,
            //     ),
            //     label: ("")),
            NavigationDestination(
                icon: Icon(
                  Iconsax.setting,
                  color: currentindex == 3 ? bgColor : bgColor2,
                ),
                label: ("")),
          ]);
    }

    return Scaffold(
      extendBody: false,
      bottomNavigationBar: costumNavBar(),
      body: pages(),
    );
  }
}
