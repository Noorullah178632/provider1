import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/another_provider.dart';
import 'package:provider1/prov/bottom_nav_provider.dart';
import 'package:provider1/screens/botton_nav_screen.dart';

import 'prov/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => SliderClass()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottonNavScreen(),
    );
  }
}
