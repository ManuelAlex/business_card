import 'package:dart_mappable/dart_mappable.dart';

class DatetimeJsonMapper extends SimpleMapper<DateTime> {
  const DatetimeJsonMapper();

  @override
  DateTime decode(Object value) {
    if (value is int) {
      final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        value * 1000,
        isUtc: true,
      );

      return dateTime;
    } else if (value is String) {
      final DateTime dateTime = DateTime.parse(value);

      return dateTime;
    }
    throw MapperException.unexpectedType(value.runtimeType, 'int or String');
  }

  @override
  Object encode(DateTime self) => self.toUtc().toIso8601String();
}
