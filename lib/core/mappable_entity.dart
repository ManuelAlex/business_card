import 'package:dart_mappable/dart_mappable.dart';

/// Annotation for Entity.
///
/// Note that extending [MappableClass] has its limitations due to incomplete
/// parsing from builder. For example, it is not possible to use
/// [MappableClass.includeCustomMappers].
class MappableEntity extends MappableClass {
  const MappableEntity()
    : super(
        generateMethods:
            GenerateMethods.copy |
            GenerateMethods.equals |
            GenerateMethods.stringify,
      );
}
