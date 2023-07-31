import 'package:flutter/material.dart';
import 'package:friends_wave/models/location.dart';
import 'package:provider/provider.dart';

import './screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Friends Wave',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const SplashWrapper(),
      )
    );
  }
}

