import 'package:dart_mappable/dart_mappable.dart';

import '../../core/entity.dart';
import '../../core/mappable_entity.dart';

part 'business.mapper.dart';

/// This class serves as a unified interface for both `CategoryDetails` and `OnThisDayCategory`.
/// - Combines multiple facets (`CategoryDetails` and `OnThisDayCategory`) into a single entity.
/// - Allows dynamic handling of both regular categories and "On This Day" events.

@MappableEntity()
class Business extends Entity<String> with BusinessMappable {
  const Business({
    required super.timestamp,
    required this.name,
    required this.location,
    required this.phoneNumber,
  }) : super(id: name); // assuming each business name is different

  /// Factory constructor for generating random test data
  factory Business.random() {
    return Business(
      timestamp: DateTime.now(),
      name: 'Business name',
      location: 'Business location',
      phoneNumber: 'Business PhoneNumber',
    );
  }

  final String name;
  final String location;
  final String phoneNumber;

  /// Calculates relevance score based on how many words from query appear in any field
  double calcRelevance(List<String> queryParts) {
    double relevance = 0;
    for (final String part in queryParts) {
      final String lowerPart = part.toLowerCase();
      if (name.toLowerCase().contains(lowerPart)) {
        relevance += 2;
      }
      if (location.toLowerCase().contains(lowerPart)) {
        relevance += 1;
      }
      if (phoneNumber.toLowerCase().contains(lowerPart)) {
        relevance += 0.5;
      }
    }
    return relevance;
  }
}
