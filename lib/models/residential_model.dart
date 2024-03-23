import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'residential_model.freezed.dart';

@freezed
class ResidentialModel with _$ResidentialModel {
  factory ResidentialModel({
    String? id,
    String? image,
    List<String>? photos,
    String? name,
    String? address,
    String? description,
    List<String>? access,
    double? distance,
    double? latitude,
    double? longitude,
  }) = _ResidentialModel;

  factory ResidentialModel.fromJSON(String id, Map<String, dynamic> json) =>
      ResidentialModel(
        id: id,
        name: json['name'],
        image: json['image'],
        photos: json['photos'],
        address: json['address'],
        description: json['description'],
        access: json['access'],
        distance: json['distance'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
