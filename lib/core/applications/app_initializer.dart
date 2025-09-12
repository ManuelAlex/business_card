import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/data_source/local_data_source/buiness_local_data_source.dart';
import '../../data/data_source/remote_data_source/business_remote_data_source.dart';
import '../../data/repository/business_repository_impl.dart';
import '../../presentation/providers/provider.dart';

class AppInitializer {
  AppInitializer({Dio? dioClient})
    : dio = dioClient ?? Dio(),
      localDataSource = BusinessLocalDataSource(),
      remoteDataSource = BusinessRemoteDataSource(dio: dioClient ?? Dio()) {
    repository = BusinessRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  }

  final Dio dio;
  final BusinessLocalDataSource localDataSource;
  final BusinessRemoteDataSource remoteDataSource;
  late final BusinessRepositoryImpl repository;

  List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(create: (_) => BusinessProvider(repository)),
  ];
}

/// Entry point function to run the app using the provided AppInitializer
void runApplication(AppInitializer appInitializer, Widget myApp) {
  runApp(MultiProvider(providers: appInitializer.providers, child: myApp));
}
