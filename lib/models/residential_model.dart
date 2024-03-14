import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'residential_model.g.dart';
part 'residential_model.freezed.dart';

@freezed
class ResidentialModel with _$ResidentialModel {
  factory ResidentialModel({
    String? images,
    String? name,
    String? address,
    String? distance,
    double? latitude,
    double? longitude,
  }) = _ResidentialModel;

  factory ResidentialModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentialModelFromJson(json);
}
