// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residential_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResidentialModelImpl _$$ResidentialModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentialModelImpl(
      images: json['images'] as String?,
      photos: json['photos'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      access: json['access'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ResidentialModelImplToJson(
        _$ResidentialModelImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'photos': instance.photos,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'access': instance.access,
      'distance': instance.distance,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
