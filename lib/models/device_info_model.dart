import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info_model.freezed.dart';
part 'device_info_model.g.dart';

@freezed
class DeviceInfoModel with _$DeviceInfoModel {
  factory DeviceInfoModel({
    String? model,
    String? id,
    String? version,
  }) = _DeviceInfoModel;

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoModelFromJson(json);
}
