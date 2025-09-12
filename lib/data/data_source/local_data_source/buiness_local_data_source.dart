import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../core/failure.dart';
import '../../../domain/entities/business.dart';
import '../../dtos/business_dto_1.dart';
import '../../dtos/business_dto_mapper.dart';

class BusinessLocalDataSource {
  BusinessLocalDataSource({this.assetPath = 'assets/business.json'});
  final String assetPath;

  Future<Either<Failure, List<Business>>> loadBusinesses() async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final List<dynamic> businessJsonData =
          jsonDecode(jsonString) as List<dynamic>;

      // JSON -> DTOs
      final List<BusinessDto1> businessesDto1 = businessJsonData
          .map((e) => BusinessDto1Mapper.fromMap(e as Map<String, dynamic>))
          .toList();

      // DTOs -> Domain
      final List<Business> businesses = const BusinessDtoMapper()
          .convertList<BusinessDto1, Business>(businessesDto1);

      return Right(businesses);
    } catch (e) {
      return Left(Failure('Failed to load businesses: $e'));
    }
  }
}
