import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'data/data_source/local_data_source/buiness_local_data_source.dart';
import 'data/data_source/remote_data_source/business_remote_data_source.dart';
import 'data/repository/business_repository_impl.dart';
import 'presentation/providers/provider.dart';
import 'presentation/screens/business_list_screen.dart';

void main() {
  final BusinessRepositoryImpl repository = BusinessRepositoryImpl(
    localDataSource: BusinessLocalDataSource(),
    remoteDataSource: BusinessRemoteDataSource(dio: Dio()),
  );

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(create: (_) => BusinessProvider(repository)),
      ],
      child: const MyApp(),
    ),
  );
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
    return const BusinessListScreen();
  }
}
