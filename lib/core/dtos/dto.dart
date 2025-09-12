import 'package:flutter/foundation.dart';

import 'json_map.dart';

/// A base class for Data Transfer Objects (DTOs).
///
/// DTOs are used to transfer data between the application and external sources.
@immutable
abstract class Dto {
  const Dto();

  /// Converts the DTO object to a map representation.
  ///
  /// The map can be used to encode the DTO object to JSON.
  /// This method is implemented by dart_mappable's auto-generated code.
  JsonMap toMap();

  /// Converts the DTO object to a JSON document.
  ///
  /// This is useful when sending the DTO as a payload in API requests.
  JsonMap toJsonDocument() => toMap();
}
