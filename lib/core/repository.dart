import 'package:dartz/dartz.dart';

import 'entity.dart';
import 'failure.dart';
import 'page_request.dart';
import 'search_criteria.dart';
import 'sort_order.dart';

/// Repositories are a specific and immutable abstraction over a collection of
/// domain objects.
abstract class Repository<TId, TEntity extends Entity<TId>> {
  const Repository();

  Future<Either<Failure, Iterable<TEntity>>> listAll(
    List<SortOrder> sortOrders, {
    PageRequest? pageRequest,
    bool includeDeleted = false,
  });

  Stream<Either<Failure, Iterable<TEntity>>> streamAll(
    List<SortOrder> sortOrders, {
    PageRequest? pageRequest,
    bool includeDeleted = false,
  });

  Future<Either<Failure, Iterable<TEntity>>> search(
    List<SortOrder> sortOrders,
    SearchCriteria searchCriteria,
  );

  Future<Either<Failure, int>> count();

  Future<Either<Failure, bool>> isEmpty();

  Future<Either<Failure, TEntity>> getById(TId id);

  Future<Either<Failure, TEntity?>> getByIdOrNull(TId id);

  Stream<Either<Failure, TEntity>> streamById(TId id);
}
