// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'business_dto_1.dart';

class BusinessDto1Mapper extends ClassMapperBase<BusinessDto1> {
  BusinessDto1Mapper._();

  static BusinessDto1Mapper? _instance;
  static BusinessDto1Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BusinessDto1Mapper._());
      MapperContainer.globals.useAll(<MapperBase<Object>>[
        DatetimeJsonMapper(),
      ]);
    }
    return _instance!;
  }

  @override
  final String id = 'BusinessDto1';

  static String _$name(BusinessDto1 v) => v.name;
  static const Field<BusinessDto1, String> _f$name = Field(
    'name',
    _$name,
    key: r'biz_name',
  );
  static String _$location(BusinessDto1 v) => v.location;
  static const Field<BusinessDto1, String> _f$location = Field(
    'location',
    _$location,
    key: r'bss_location',
  );
  static String _$phoneNumber(BusinessDto1 v) => v.phoneNumber;
  static const Field<BusinessDto1, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'contct_no',
  );
  static DateTime _$timestamp(BusinessDto1 v) => v.timestamp;
  static const Field<BusinessDto1, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );

  @override
  final MappableFields<BusinessDto1> fields = const {
    #name: _f$name,
    #location: _f$location,
    #phoneNumber: _f$phoneNumber,
    #timestamp: _f$timestamp,
  };

  static BusinessDto1 _instantiate(DecodingData data) {
    return BusinessDto1(
      name: data.dec(_f$name),
      location: data.dec(_f$location),
      phoneNumber: data.dec(_f$phoneNumber),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BusinessDto1 fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BusinessDto1>(map);
  }

  static BusinessDto1 fromJson(String json) {
    return ensureInitialized().decodeJson<BusinessDto1>(json);
  }
}

mixin BusinessDto1Mappable {
  String toJson() {
    return BusinessDto1Mapper.ensureInitialized().encodeJson<BusinessDto1>(
      this as BusinessDto1,
    );
  }

  Map<String, dynamic> toMap() {
    return BusinessDto1Mapper.ensureInitialized().encodeMap<BusinessDto1>(
      this as BusinessDto1,
    );
  }

  BusinessDto1CopyWith<BusinessDto1, BusinessDto1, BusinessDto1> get copyWith =>
      _BusinessDto1CopyWithImpl<BusinessDto1, BusinessDto1>(
        this as BusinessDto1,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BusinessDto1Mapper.ensureInitialized().stringifyValue(
      this as BusinessDto1,
    );
  }

  @override
  bool operator ==(Object other) {
    return BusinessDto1Mapper.ensureInitialized().equalsValue(
      this as BusinessDto1,
      other,
    );
  }

  @override
  int get hashCode {
    return BusinessDto1Mapper.ensureInitialized().hashValue(
      this as BusinessDto1,
    );
  }
}

extension BusinessDto1ValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BusinessDto1, $Out> {
  BusinessDto1CopyWith<$R, BusinessDto1, $Out> get $asBusinessDto1 =>
      $base.as((v, t, t2) => _BusinessDto1CopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BusinessDto1CopyWith<$R, $In extends BusinessDto1, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    String? location,
    String? phoneNumber,
    DateTime? timestamp,
  });
  BusinessDto1CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BusinessDto1CopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BusinessDto1, $Out>
    implements BusinessDto1CopyWith<$R, BusinessDto1, $Out> {
  _BusinessDto1CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BusinessDto1> $mapper =
      BusinessDto1Mapper.ensureInitialized();
  @override
  $R call({
    String? name,
    String? location,
    String? phoneNumber,
    DateTime? timestamp,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (location != null) #location: location,
      if (phoneNumber != null) #phoneNumber: phoneNumber,
      if (timestamp != null) #timestamp: timestamp,
    }),
  );
  @override
  BusinessDto1 $make(CopyWithData data) => BusinessDto1(
    name: data.get(#name, or: $value.name),
    location: data.get(#location, or: $value.location),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    timestamp: data.get(#timestamp, or: $value.timestamp),
  );

  @override
  BusinessDto1CopyWith<$R2, BusinessDto1, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BusinessDto1CopyWithImpl<$R2, $Out2>($value, $cast, t);
}

