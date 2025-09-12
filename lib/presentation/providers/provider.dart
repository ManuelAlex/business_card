import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../core/failure.dart';
import '../../core/search_criteria.dart';
import '../../core/sort_order.dart';
import '../../data/repository/business_repository_impl.dart';
import '../../domain/entities/business.dart';
import 'provider_states/business_state.dart';

class BusinessProvider extends ChangeNotifier {
  BusinessProvider(this._repository) {
    loadBusinesses(); // auto-load on creation
  }

  final BusinessRepositoryImpl _repository;

  BusinessState _state = const BusinessLoading();
  BusinessState get state => _state;

  List<Business>? _cache;

  Future<void> loadBusinesses({
    bool forceRefresh = false,
    List<SortOrder> sortOrder = const <SortOrder>[],
  }) async {
    if (!forceRefresh && _cache != null) {
      _state = BusinessData(_cache!);
      notifyListeners();
      return;
    }

    _state = const BusinessLoading();
    notifyListeners();

    final Either<Failure, Iterable<Business>> result = await _repository
        .listAll(sortOrder);

    result.fold(
      (Failure failure) {
        _state = BusinessError(failure);
      },
      (Iterable<Business> businesses) {
        _cache = businesses.toList();
        if (_cache!.isEmpty) {
          _state = const BusinessEmpty();
        } else {
          _state = BusinessData(_cache!);
        }
      },
    );

    notifyListeners();
  }

  Future<void> searchBusinesses(SearchCriteria criteria) async {
    _state = const BusinessLoading();
    notifyListeners();

    final Either<Failure, Iterable<Business>> result = await _repository.search(
      <SortOrder>[],
      criteria,
    );

    result.fold(
      (Failure failure) {
        _state = BusinessError(failure);
      },
      (Iterable<Business> businesses) {
        _state = BusinessData(businesses.toList());
      },
    );

    notifyListeners();
  }

  /// Clears cache and forces reload next time
  void clearCache() {
    _cache = null;
  }
}
