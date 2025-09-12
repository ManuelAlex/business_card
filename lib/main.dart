import 'package:flutter/material.dart';

import 'core/applications/app_initializer.dart';
import 'presentation/screens/business_list_screen.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();
  runApplication(appInitializer, const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const BusinessHomePage(),
    );
  }
}

class BusinessHomePage extends StatelessWidget {
  const BusinessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BusinessListScreen();
  }
}
