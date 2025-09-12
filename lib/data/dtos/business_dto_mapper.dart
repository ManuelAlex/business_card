import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../domain/entities/business.dart';
import 'business_dto_1.dart';
import 'business_dto_mapper.auto_mappr.dart';

@AutoMappr(<MapType<Object, Object>>[
  MapType<BusinessDto1, Business>(reverse: true),
])
class BusinessDtoMapper extends $BusinessDtoMapper {
  const BusinessDtoMapper();
}
