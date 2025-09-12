import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/failure.dart';
import '../../../domain/entities/business.dart';
import '../../dtos/business_dto_1.dart';
import '../../dtos/business_dto_mapper.dart';

class BusinessRemoteDataSource {
  BusinessRemoteDataSource({required this.dio, this.baseUrl});

  final Dio dio;
  final String? baseUrl;

  Future<Either<Failure, List<Business>>> fetchBusinesses() async {
    if (baseUrl == null || baseUrl!.isEmpty) {
      return const Left(Failure('No remote URL configured'));
    }

    try {
      final Response response = await dio.get('$baseUrl/businesses');

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> data = response.data as List<dynamic>;

        //  Map response JSON into DTOs
        final List<BusinessDto1> dtoList = data
            .map(
              (json) =>
                  BusinessDto1Mapper.fromMap(json as Map<String, dynamic>),
            )
            .toList();

        //  Convert DTOs -> Domain
        final List<Business> businesses = const BusinessDtoMapper()
            .convertList<BusinessDto1, Business>(dtoList);

        return Right(businesses);
      } else {
        return Left(Failure('Unexpected response: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Failure('Remote fetch failed: $e'));
    }
  }
}
