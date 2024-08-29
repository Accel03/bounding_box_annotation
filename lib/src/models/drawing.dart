import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawing.freezed.dart';
part 'drawing.g.dart';

@freezed
class StartPoint with _$StartPoint {
  const factory StartPoint({
    required double dx,
    required double dy
  }) = _StartPoint;
 
  factory StartPoint.fromJson(Map<String, dynamic> json) =>
    _$StartPointFromJson(json);
}

@freezed
class EndPoint with _$EndPoint {
  const factory EndPoint({
    required double dx,
    required double dy
  }) = _EndPoint;

  factory EndPoint.fromJson(Map<String, dynamic> json) =>
    _$EndPointFromJson(json);
}

@freezed
class Paint with _$Paint {
  const factory Paint({
    required int blendMode,
    required int color,
    required int filterQuality,
    required bool invertColors,
    required bool isAntiAlias,
    required int strokeCap,
    required int strokeJoin,
    required double strokeWidth,
    required int style
  }) = _Paint;

  factory Paint.fromJson(Map<String, dynamic> json) =>
    _$PaintFromJson(json);
}


@freezed
class Drawing with _$Drawing {
  const factory Drawing({
    required String type,
    required StartPoint startPoint,
    required EndPoint endPoint,
    required Paint paint,
    required String label
  }) = _Drawing;

  factory Drawing.fromJson(Map<String, dynamic> json) =>
    _$DrawingFromJson(json);
}