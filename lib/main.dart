import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const BusinessHomePage(),
    );
  }
}

class BusinessHomePage extends StatelessWidget {
  const BusinessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
