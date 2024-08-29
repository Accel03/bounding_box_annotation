// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartPointImpl _$$StartPointImplFromJson(Map<String, dynamic> json) =>
    _$StartPointImpl(
      dx: (json['dx'] as num).toDouble(),
      dy: (json['dy'] as num).toDouble(),
    );

Map<String, dynamic> _$$StartPointImplToJson(_$StartPointImpl instance) =>
    <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
    };

_$EndPointImpl _$$EndPointImplFromJson(Map<String, dynamic> json) =>
    _$EndPointImpl(
      dx: (json['dx'] as num).toDouble(),
      dy: (json['dy'] as num).toDouble(),
    );

Map<String, dynamic> _$$EndPointImplToJson(_$EndPointImpl instance) =>
    <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
    };

_$PaintImpl _$$PaintImplFromJson(Map<String, dynamic> json) => _$PaintImpl(
      blendMode: (json['blendMode'] as num).toInt(),
      color: (json['color'] as num).toInt(),
      filterQuality: (json['filterQuality'] as num).toInt(),
      invertColors: json['invertColors'] as bool,
      isAntiAlias: json['isAntiAlias'] as bool,
      strokeCap: (json['strokeCap'] as num).toInt(),
      strokeJoin: (json['strokeJoin'] as num).toInt(),
      strokeWidth: (json['strokeWidth'] as num).toDouble(),
      style: (json['style'] as num).toInt(),
    );

Map<String, dynamic> _$$PaintImplToJson(_$PaintImpl instance) =>
    <String, dynamic>{
      'blendMode': instance.blendMode,
      'color': instance.color,
      'filterQuality': instance.filterQuality,
      'invertColors': instance.invertColors,
      'isAntiAlias': instance.isAntiAlias,
      'strokeCap': instance.strokeCap,
      'strokeJoin': instance.strokeJoin,
      'strokeWidth': instance.strokeWidth,
      'style': instance.style,
    };

_$DrawingImpl _$$DrawingImplFromJson(Map<String, dynamic> json) =>
    _$DrawingImpl(
      type: json['type'] as String,
      startPoint:
          StartPoint.fromJson(json['startPoint'] as Map<String, dynamic>),
      endPoint: EndPoint.fromJson(json['endPoint'] as Map<String, dynamic>),
      paint: Paint.fromJson(json['paint'] as Map<String, dynamic>),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$DrawingImplToJson(_$DrawingImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'startPoint': instance.startPoint,
      'endPoint': instance.endPoint,
      'paint': instance.paint,
      'label': instance.label,
    };
