import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/another_provider.dart';
import 'package:provider1/prov/bottom_nav_provider.dart';
import 'package:provider1/prov/favorite_provider.dart';
import 'package:provider1/prov/login_api_provider.dart';
import 'package:provider1/prov/themeMode_provider.dart';
import 'package:provider1/screens/apiLogin_provider.dart';

import 'prov/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => SliderClass()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThememodeProvider()),
        ChangeNotifierProvider(create: (_) => LoginApiProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThememodeProvider>(
      builder: (context, provider, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: AppBarTheme(color: Colors.blue),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(color: Colors.black87),
          ),
          themeMode: provider.thememode,

          home: ApiloginProvider(),
        );
      },
    );
  }
}
