import 'package:flutter/foundation.dart';

@immutable
abstract class Entity<TEntityId> {
  const Entity({required this.id, required this.timestamp});

  /// Unique ID of the entity. Could be a UUID, integer, or other unique identifier.
  final TEntityId id;

  /// Timestamp indicating when the entity was created.
  final DateTime timestamp;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Entity<TEntityId> && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Entity(id: $id, timeStamp: $timestamp)';
}
