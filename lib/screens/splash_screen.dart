import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'home_screen.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  @override
  void initState() {
    super.initState();
    _getLocationAndNavigate();
  }

  _getLocationAndNavigate() async {
    Location location = Location();

    // Check if location service is enabled
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location service is not enabled, handle accordingly (e.g., show an error message).
        return;
      }
    }

    // Check for location permission
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // Location permission not granted, handle accordingly (e.g., show an error message).
        return;
      }
    }

    // Get the user's location
    LocationData locationData = await location.getLocation();

    // Now you have the user's location in the 'locationData' variable.
    // You can pass it to your HomeScreen or use it as needed.
    if(!mounted) return ;

    // Example: Navigate to HomeScreen with location data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
