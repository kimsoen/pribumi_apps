import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pribumi_apps/navbar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _chekPermission(BuildContext context) async {
    LocationPermission check = await Geolocator.checkPermission();
    if (check == LocationPermission.denied ||
        check == LocationPermission.deniedForever) {
      if (context.mounted) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Center(child: Text('Ijin Lokasi ')),
            content: const Text(
                'Ijin lokasi belum di aktifkan, silakan aktifkan terlebih dahulu.'),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    await Geolocator.requestPermission();
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('OK'))
            ],
          ),
        );
      }
    }
  }

  _nextPage() async {
    await _chekPermission(context);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavBarpage(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    _nextPage();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
