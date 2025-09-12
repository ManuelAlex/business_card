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
}
