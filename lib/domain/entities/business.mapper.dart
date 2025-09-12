// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'business.dart';

class BusinessMapper extends ClassMapperBase<Business> {
  BusinessMapper._();

  static BusinessMapper? _instance;
  static BusinessMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BusinessMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Business';

  static DateTime _$timestamp(Business v) => v.timestamp;
  static const Field<Business, DateTime> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
  );
  static String _$name(Business v) => v.name;
  static const Field<Business, String> _f$name = Field('name', _$name);
  static String _$location(Business v) => v.location;
  static const Field<Business, String> _f$location = Field(
    'location',
    _$location,
  );
  static String _$phoneNumber(Business v) => v.phoneNumber;
  static const Field<Business, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
  );

  @override
  final MappableFields<Business> fields = const {
    #timestamp: _f$timestamp,
    #name: _f$name,
    #location: _f$location,
    #phoneNumber: _f$phoneNumber,
  };

  static Business _instantiate(DecodingData data) {
    return Business(
      timestamp: data.dec(_f$timestamp),
      name: data.dec(_f$name),
      location: data.dec(_f$location),
      phoneNumber: data.dec(_f$phoneNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;
}

mixin BusinessMappable {
  BusinessCopyWith<Business, Business, Business> get copyWith =>
      _BusinessCopyWithImpl<Business, Business>(
        this as Business,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BusinessMapper.ensureInitialized().stringifyValue(this as Business);
  }

  @override
  bool operator ==(Object other) {
    return BusinessMapper.ensureInitialized().equalsValue(
      this as Business,
      other,
    );
  }

  @override
  int get hashCode {
    return BusinessMapper.ensureInitialized().hashValue(this as Business);
  }
}

extension BusinessValueCopy<$R, $Out> on ObjectCopyWith<$R, Business, $Out> {
  BusinessCopyWith<$R, Business, $Out> get $asBusiness =>
      $base.as((v, t, t2) => _BusinessCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BusinessCopyWith<$R, $In extends Business, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    DateTime? timestamp,
    String? name,
    String? location,
    String? phoneNumber,
  });
  BusinessCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BusinessCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Business, $Out>
    implements BusinessCopyWith<$R, Business, $Out> {
  _BusinessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Business> $mapper =
      BusinessMapper.ensureInitialized();
  @override
  $R call({
    DateTime? timestamp,
    String? name,
    String? location,
    String? phoneNumber,
  }) => $apply(
    FieldCopyWithData({
      if (timestamp != null) #timestamp: timestamp,
      if (name != null) #name: name,
      if (location != null) #location: location,
      if (phoneNumber != null) #phoneNumber: phoneNumber,
    }),
  );
  @override
  Business $make(CopyWithData data) => Business(
    timestamp: data.get(#timestamp, or: $value.timestamp),
    name: data.get(#name, or: $value.name),
    location: data.get(#location, or: $value.location),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
  );

  @override
  BusinessCopyWith<$R2, Business, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _BusinessCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

