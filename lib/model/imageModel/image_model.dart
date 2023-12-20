import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_model.g.dart';
part 'image_model.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    String? id,
    @Default("Name not available") String author,
    @Default(0) int width,
    @Default(0) int height,
    String? url,
    String? downloadUrl,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
