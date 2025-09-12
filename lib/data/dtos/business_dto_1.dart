import 'package:dart_mappable/dart_mappable.dart';

import '../../core/dtos/dto.dart';
import '../../core/json_mapper/date_time_json_mapper.dart';

part 'business_dto_1.mapper.dart';

@MappableClass(includeCustomMappers: <MapperBase<Object>>[DatetimeJsonMapper()])
class BusinessDto1 extends Dto with BusinessDto1Mappable {
  const BusinessDto1({
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.timestamp,
  });

  /// Random factory constructor for test purposes.
  factory BusinessDto1.random() => BusinessDto1(
    timestamp: DateTime.timestamp(),
    name: 'Business name',
    location: 'Business location',
    phoneNumber: 'Business PhoneNumber',
  );
  final DateTime timestamp;
  @MappableField(key: 'biz_name')
  final String name;

  @MappableField(key: 'bss_location')
  final String location;

  @MappableField(key: 'contct_no')
  final String phoneNumber;
}
