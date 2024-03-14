// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'residential_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResidentialModel _$ResidentialModelFromJson(Map<String, dynamic> json) {
  return _ResidentialModel.fromJson(json);
}

/// @nodoc
mixin _$ResidentialModel {
  String? get images => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidentialModelCopyWith<ResidentialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentialModelCopyWith<$Res> {
  factory $ResidentialModelCopyWith(
          ResidentialModel value, $Res Function(ResidentialModel) then) =
      _$ResidentialModelCopyWithImpl<$Res, ResidentialModel>;
  @useResult
  $Res call(
      {String? images,
      String? name,
      String? address,
      String? distance,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$ResidentialModelCopyWithImpl<$Res, $Val extends ResidentialModel>
    implements $ResidentialModelCopyWith<$Res> {
  _$ResidentialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? distance = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidentialModelImplCopyWith<$Res>
    implements $ResidentialModelCopyWith<$Res> {
  factory _$$ResidentialModelImplCopyWith(_$ResidentialModelImpl value,
          $Res Function(_$ResidentialModelImpl) then) =
      __$$ResidentialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? images,
      String? name,
      String? address,
      String? distance,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$ResidentialModelImplCopyWithImpl<$Res>
    extends _$ResidentialModelCopyWithImpl<$Res, _$ResidentialModelImpl>
    implements _$$ResidentialModelImplCopyWith<$Res> {
  __$$ResidentialModelImplCopyWithImpl(_$ResidentialModelImpl _value,
      $Res Function(_$ResidentialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? distance = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$ResidentialModelImpl(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResidentialModelImpl
    with DiagnosticableTreeMixin
    implements _ResidentialModel {
  _$ResidentialModelImpl(
      {this.images,
      this.name,
      this.address,
      this.distance,
      this.latitude,
      this.longitude});

  factory _$ResidentialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentialModelImplFromJson(json);

  @override
  final String? images;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? distance;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResidentialModel(images: $images, name: $name, address: $address, distance: $distance, latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResidentialModel'))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentialModelImpl &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, images, name, address, distance, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentialModelImplCopyWith<_$ResidentialModelImpl> get copyWith =>
      __$$ResidentialModelImplCopyWithImpl<_$ResidentialModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentialModelImplToJson(
      this,
    );
  }
}

abstract class _ResidentialModel implements ResidentialModel {
  factory _ResidentialModel(
      {final String? images,
      final String? name,
      final String? address,
      final String? distance,
      final double? latitude,
      final double? longitude}) = _$ResidentialModelImpl;

  factory _ResidentialModel.fromJson(Map<String, dynamic> json) =
      _$ResidentialModelImpl.fromJson;

  @override
  String? get images;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get distance;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$ResidentialModelImplCopyWith<_$ResidentialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
