import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../core/page_request.dart';
import '../../core/search_criteria.dart';
import '../../core/search_operator.dart';
import '../../core/sort_order.dart';
import '../../domain/entities/business.dart';
import '../../domain/repository/business_repository.dart';
import '../data_source/local_data_source/buiness_local_data_source.dart';
import '../data_source/remote_data_source/business_remote_data_source.dart';

class BusinessRepositoryImpl extends BusinessRepository {
  BusinessRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final BusinessLocalDataSource localDataSource;
  final BusinessRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, int>> count() async {
    final Either<Failure, Iterable<Business>> result = await listAll(
      <SortOrder>[],
    );
    return result.map((Iterable<Business> businesses) => businesses.length);
  }

  @override
  Future<Either<Failure, Business>> getById(BusinessId id) async {
    final Either<Failure, Iterable<Business>> result = await listAll(
      <SortOrder>[],
    );
    return result.fold(Left.new, (Iterable<Business> businesses) {
      try {
        final Business business = businesses.firstWhere(
          (Business biz) => biz.id == id,
          orElse: () => throw Exception('Business not found'),
        );
        return Right(business);
      } catch (_) {
        return const Left(Failure('Business not found'));
      }
    });
  }

  @override
  Future<Either<Failure, Business?>> getByIdOrNull(BusinessId id) async {
    final Either<Failure, Business> result = await getById(id);
    return result.fold((Failure failure) => const Right(null), Right.new);
  }

  @override
  Future<Either<Failure, bool>> isEmpty() async {
    final Either<Failure, Iterable<Business>> result = await listAll(
      <SortOrder>[],
    );
    return result.map((Iterable<Business> businesses) => businesses.isEmpty);
  }

  @override
  Future<Either<Failure, Iterable<Business>>> listAll(
    List<SortOrder> sortOrders, {
    PageRequest? pageRequest,
    bool includeDeleted = false,
  }) async {
    final Either<Failure, List<Business>> remoteResult = await remoteDataSource
        .fetchBusinesses();

    return await remoteResult.fold((Failure failure) async {
      // fallback to local if remote fails
      final Either<Failure, List<Business>> localResult = await localDataSource
          .loadBusinesses();
      return localResult.fold(Left.new, Right.new);
    }, (List<Business> businesses) async => Right(businesses));
  }

  @override
  Future<Either<Failure, Iterable<Business>>> search(
    List<SortOrder> sortOrders,
    SearchCriteria searchCriteria,
  ) async {
    final Either<Failure, Iterable<Business>> result = await listAll(
      sortOrders,
    );
    return result.map((Iterable<Business> businesses) {
      return businesses.where((Business biz) {
        if (searchCriteria.operator == SearchOperator.equals &&
            searchCriteria.field == 'name') {
          return biz.name == searchCriteria.value;
        }
        return true;
      });
    });
  }
}
