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
    final result = await listAll(<SortOrder>[]);
    return result.map((businesses) => businesses.length);
  }

  @override
  Future<Either<Failure, Business>> getById(BusinessId id) async {
    final result = await listAll(<SortOrder>[]);
    return result.fold(Left.new, (businesses) {
      try {
        final business = businesses.firstWhere(
          (biz) => biz.id == id,
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
    final result = await getById(id);
    return result.fold((failure) => const Right(null), Right.new);
  }

  @override
  Future<Either<Failure, bool>> isEmpty() async {
    final result = await listAll(<SortOrder>[]);
    return result.map((businesses) => businesses.isEmpty);
  }

  @override
  Future<Either<Failure, Iterable<Business>>> listAll(
    List<SortOrder> sortOrders, {
    PageRequest? pageRequest,
    bool includeDeleted = false,
  }) async {
    final Either<Failure, List<Business>> remoteResult = await remoteDataSource
        .fetchBusinesses();

    return await remoteResult.fold((failure) async {
      // fallback to local if remote fails
      final localResult = await localDataSource.loadBusinesses();
      return localResult.fold(Left.new, Right.new);
    }, (businesses) async => Right(businesses));
  }

  @override
  Future<Either<Failure, Iterable<Business>>> search(
    List<SortOrder> sortOrders,
    SearchCriteria searchCriteria,
  ) async {
    final result = await listAll(sortOrders);
    return result.map((businesses) {
      return businesses.where((biz) {
        if (searchCriteria.operator == SearchOperator.equals &&
            searchCriteria.field == 'name') {
          return biz.name == searchCriteria.value;
        }
        return true;
      });
    });
  }

  @override
  Stream<Either<Failure, Iterable<Business>>> streamAll(
    List<SortOrder> sortOrders, {
    PageRequest? pageRequest,
    bool includeDeleted = false,
  }) async* {
    yield await listAll(sortOrders);
  }

  @override
  Stream<Either<Failure, Business>> streamById(BusinessId id) async* {
    final result = await getById(id);
    yield result;
  }
}
