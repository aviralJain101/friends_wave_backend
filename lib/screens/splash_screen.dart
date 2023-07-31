import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/location.dart';
import 'home_screen.dart';

class SplashWrapper extends StatelessWidget {
  const SplashWrapper({Key? key}) : super(key: key);

  Future<void> _getLocationAndNavigate(BuildContext context) async {
    // Get the LocationProvider instance
    LocationProvider locationProvider = Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.getLocationData();

    // Example: Perform additional loading tasks if needed

    // No need to use Navigator here; the FutureBuilder will handle the navigation.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _getLocationAndNavigate(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
