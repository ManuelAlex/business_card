import 'package:flutter/foundation.dart';

import 'search_operator.dart';

@immutable
class SearchCriteria {
  const SearchCriteria({
    required this.operator,
    this.field,
    this.value,
    this.list,
  });
  final SearchOperator operator;
  final String? field;
  final dynamic value;
  final List<SearchCriteria>? list;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchCriteria &&
          operator == other.operator &&
          field == other.field &&
          value == other.value &&
          listEquals(list, other.list);

  @override
  int get hashCode =>
      operator.hashCode ^ field.hashCode ^ value.hashCode ^ list.hashCode;
}
