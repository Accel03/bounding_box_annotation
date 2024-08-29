// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartPoint _$StartPointFromJson(Map<String, dynamic> json) {
  return _StartPoint.fromJson(json);
}

/// @nodoc
mixin _$StartPoint {
  double get dx => throw _privateConstructorUsedError;
  double get dy => throw _privateConstructorUsedError;

  /// Serializes this StartPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartPointCopyWith<StartPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartPointCopyWith<$Res> {
  factory $StartPointCopyWith(
          StartPoint value, $Res Function(StartPoint) then) =
      _$StartPointCopyWithImpl<$Res, StartPoint>;
  @useResult
  $Res call({double dx, double dy});
}

/// @nodoc
class _$StartPointCopyWithImpl<$Res, $Val extends StartPoint>
    implements $StartPointCopyWith<$Res> {
  _$StartPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
  }) {
    return _then(_value.copyWith(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartPointImplCopyWith<$Res>
    implements $StartPointCopyWith<$Res> {
  factory _$$StartPointImplCopyWith(
          _$StartPointImpl value, $Res Function(_$StartPointImpl) then) =
      __$$StartPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dx, double dy});
}

/// @nodoc
class __$$StartPointImplCopyWithImpl<$Res>
    extends _$StartPointCopyWithImpl<$Res, _$StartPointImpl>
    implements _$$StartPointImplCopyWith<$Res> {
  __$$StartPointImplCopyWithImpl(
      _$StartPointImpl _value, $Res Function(_$StartPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
  }) {
    return _then(_$StartPointImpl(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartPointImpl implements _StartPoint {
  const _$StartPointImpl({required this.dx, required this.dy});

  factory _$StartPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartPointImplFromJson(json);

  @override
  final double dx;
  @override
  final double dy;

  @override
  String toString() {
    return 'StartPoint(dx: $dx, dy: $dy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartPointImpl &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dx, dy);

  /// Create a copy of StartPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartPointImplCopyWith<_$StartPointImpl> get copyWith =>
      __$$StartPointImplCopyWithImpl<_$StartPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartPointImplToJson(
      this,
    );
  }
}

abstract class _StartPoint implements StartPoint {
  const factory _StartPoint(
      {required final double dx, required final double dy}) = _$StartPointImpl;

  factory _StartPoint.fromJson(Map<String, dynamic> json) =
      _$StartPointImpl.fromJson;

  @override
  double get dx;
  @override
  double get dy;

  /// Create a copy of StartPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartPointImplCopyWith<_$StartPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EndPoint _$EndPointFromJson(Map<String, dynamic> json) {
  return _EndPoint.fromJson(json);
}

/// @nodoc
mixin _$EndPoint {
  double get dx => throw _privateConstructorUsedError;
  double get dy => throw _privateConstructorUsedError;

  /// Serializes this EndPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EndPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EndPointCopyWith<EndPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndPointCopyWith<$Res> {
  factory $EndPointCopyWith(EndPoint value, $Res Function(EndPoint) then) =
      _$EndPointCopyWithImpl<$Res, EndPoint>;
  @useResult
  $Res call({double dx, double dy});
}

/// @nodoc
class _$EndPointCopyWithImpl<$Res, $Val extends EndPoint>
    implements $EndPointCopyWith<$Res> {
  _$EndPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EndPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
  }) {
    return _then(_value.copyWith(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndPointImplCopyWith<$Res>
    implements $EndPointCopyWith<$Res> {
  factory _$$EndPointImplCopyWith(
          _$EndPointImpl value, $Res Function(_$EndPointImpl) then) =
      __$$EndPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double dx, double dy});
}

/// @nodoc
class __$$EndPointImplCopyWithImpl<$Res>
    extends _$EndPointCopyWithImpl<$Res, _$EndPointImpl>
    implements _$$EndPointImplCopyWith<$Res> {
  __$$EndPointImplCopyWithImpl(
      _$EndPointImpl _value, $Res Function(_$EndPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of EndPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = null,
    Object? dy = null,
  }) {
    return _then(_$EndPointImpl(
      dx: null == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double,
      dy: null == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EndPointImpl implements _EndPoint {
  const _$EndPointImpl({required this.dx, required this.dy});

  factory _$EndPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndPointImplFromJson(json);

  @override
  final double dx;
  @override
  final double dy;

  @override
  String toString() {
    return 'EndPoint(dx: $dx, dy: $dy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndPointImpl &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dx, dy);

  /// Create a copy of EndPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndPointImplCopyWith<_$EndPointImpl> get copyWith =>
      __$$EndPointImplCopyWithImpl<_$EndPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EndPointImplToJson(
      this,
    );
  }
}

abstract class _EndPoint implements EndPoint {
  const factory _EndPoint(
      {required final double dx, required final double dy}) = _$EndPointImpl;

  factory _EndPoint.fromJson(Map<String, dynamic> json) =
      _$EndPointImpl.fromJson;

  @override
  double get dx;
  @override
  double get dy;

  /// Create a copy of EndPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndPointImplCopyWith<_$EndPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Paint _$PaintFromJson(Map<String, dynamic> json) {
  return _Paint.fromJson(json);
}

/// @nodoc
mixin _$Paint {
  int get blendMode => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  int get filterQuality => throw _privateConstructorUsedError;
  bool get invertColors => throw _privateConstructorUsedError;
  bool get isAntiAlias => throw _privateConstructorUsedError;
  int get strokeCap => throw _privateConstructorUsedError;
  int get strokeJoin => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;
  int get style => throw _privateConstructorUsedError;

  /// Serializes this Paint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Paint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaintCopyWith<Paint> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintCopyWith<$Res> {
  factory $PaintCopyWith(Paint value, $Res Function(Paint) then) =
      _$PaintCopyWithImpl<$Res, Paint>;
  @useResult
  $Res call(
      {int blendMode,
      int color,
      int filterQuality,
      bool invertColors,
      bool isAntiAlias,
      int strokeCap,
      int strokeJoin,
      double strokeWidth,
      int style});
}

/// @nodoc
class _$PaintCopyWithImpl<$Res, $Val extends Paint>
    implements $PaintCopyWith<$Res> {
  _$PaintCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Paint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blendMode = null,
    Object? color = null,
    Object? filterQuality = null,
    Object? invertColors = null,
    Object? isAntiAlias = null,
    Object? strokeCap = null,
    Object? strokeJoin = null,
    Object? strokeWidth = null,
    Object? style = null,
  }) {
    return _then(_value.copyWith(
      blendMode: null == blendMode
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuality: null == filterQuality
          ? _value.filterQuality
          : filterQuality // ignore: cast_nullable_to_non_nullable
              as int,
      invertColors: null == invertColors
          ? _value.invertColors
          : invertColors // ignore: cast_nullable_to_non_nullable
              as bool,
      isAntiAlias: null == isAntiAlias
          ? _value.isAntiAlias
          : isAntiAlias // ignore: cast_nullable_to_non_nullable
              as bool,
      strokeCap: null == strokeCap
          ? _value.strokeCap
          : strokeCap // ignore: cast_nullable_to_non_nullable
              as int,
      strokeJoin: null == strokeJoin
          ? _value.strokeJoin
          : strokeJoin // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaintImplCopyWith<$Res> implements $PaintCopyWith<$Res> {
  factory _$$PaintImplCopyWith(
          _$PaintImpl value, $Res Function(_$PaintImpl) then) =
      __$$PaintImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int blendMode,
      int color,
      int filterQuality,
      bool invertColors,
      bool isAntiAlias,
      int strokeCap,
      int strokeJoin,
      double strokeWidth,
      int style});
}

/// @nodoc
class __$$PaintImplCopyWithImpl<$Res>
    extends _$PaintCopyWithImpl<$Res, _$PaintImpl>
    implements _$$PaintImplCopyWith<$Res> {
  __$$PaintImplCopyWithImpl(
      _$PaintImpl _value, $Res Function(_$PaintImpl) _then)
      : super(_value, _then);

  /// Create a copy of Paint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blendMode = null,
    Object? color = null,
    Object? filterQuality = null,
    Object? invertColors = null,
    Object? isAntiAlias = null,
    Object? strokeCap = null,
    Object? strokeJoin = null,
    Object? strokeWidth = null,
    Object? style = null,
  }) {
    return _then(_$PaintImpl(
      blendMode: null == blendMode
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      filterQuality: null == filterQuality
          ? _value.filterQuality
          : filterQuality // ignore: cast_nullable_to_non_nullable
              as int,
      invertColors: null == invertColors
          ? _value.invertColors
          : invertColors // ignore: cast_nullable_to_non_nullable
              as bool,
      isAntiAlias: null == isAntiAlias
          ? _value.isAntiAlias
          : isAntiAlias // ignore: cast_nullable_to_non_nullable
              as bool,
      strokeCap: null == strokeCap
          ? _value.strokeCap
          : strokeCap // ignore: cast_nullable_to_non_nullable
              as int,
      strokeJoin: null == strokeJoin
          ? _value.strokeJoin
          : strokeJoin // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaintImpl implements _Paint {
  const _$PaintImpl(
      {required this.blendMode,
      required this.color,
      required this.filterQuality,
      required this.invertColors,
      required this.isAntiAlias,
      required this.strokeCap,
      required this.strokeJoin,
      required this.strokeWidth,
      required this.style});

  factory _$PaintImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaintImplFromJson(json);

  @override
  final int blendMode;
  @override
  final int color;
  @override
  final int filterQuality;
  @override
  final bool invertColors;
  @override
  final bool isAntiAlias;
  @override
  final int strokeCap;
  @override
  final int strokeJoin;
  @override
  final double strokeWidth;
  @override
  final int style;

  @override
  String toString() {
    return 'Paint(blendMode: $blendMode, color: $color, filterQuality: $filterQuality, invertColors: $invertColors, isAntiAlias: $isAntiAlias, strokeCap: $strokeCap, strokeJoin: $strokeJoin, strokeWidth: $strokeWidth, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaintImpl &&
            (identical(other.blendMode, blendMode) ||
                other.blendMode == blendMode) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.filterQuality, filterQuality) ||
                other.filterQuality == filterQuality) &&
            (identical(other.invertColors, invertColors) ||
                other.invertColors == invertColors) &&
            (identical(other.isAntiAlias, isAntiAlias) ||
                other.isAntiAlias == isAntiAlias) &&
            (identical(other.strokeCap, strokeCap) ||
                other.strokeCap == strokeCap) &&
            (identical(other.strokeJoin, strokeJoin) ||
                other.strokeJoin == strokeJoin) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, blendMode, color, filterQuality,
      invertColors, isAntiAlias, strokeCap, strokeJoin, strokeWidth, style);

  /// Create a copy of Paint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaintImplCopyWith<_$PaintImpl> get copyWith =>
      __$$PaintImplCopyWithImpl<_$PaintImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaintImplToJson(
      this,
    );
  }
}

abstract class _Paint implements Paint {
  const factory _Paint(
      {required final int blendMode,
      required final int color,
      required final int filterQuality,
      required final bool invertColors,
      required final bool isAntiAlias,
      required final int strokeCap,
      required final int strokeJoin,
      required final double strokeWidth,
      required final int style}) = _$PaintImpl;

  factory _Paint.fromJson(Map<String, dynamic> json) = _$PaintImpl.fromJson;

  @override
  int get blendMode;
  @override
  int get color;
  @override
  int get filterQuality;
  @override
  bool get invertColors;
  @override
  bool get isAntiAlias;
  @override
  int get strokeCap;
  @override
  int get strokeJoin;
  @override
  double get strokeWidth;
  @override
  int get style;

  /// Create a copy of Paint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaintImplCopyWith<_$PaintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Drawing _$DrawingFromJson(Map<String, dynamic> json) {
  return _Drawing.fromJson(json);
}

/// @nodoc
mixin _$Drawing {
  String get type => throw _privateConstructorUsedError;
  StartPoint get startPoint => throw _privateConstructorUsedError;
  EndPoint get endPoint => throw _privateConstructorUsedError;
  Paint get paint => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this Drawing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrawingCopyWith<Drawing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingCopyWith<$Res> {
  factory $DrawingCopyWith(Drawing value, $Res Function(Drawing) then) =
      _$DrawingCopyWithImpl<$Res, Drawing>;
  @useResult
  $Res call(
      {String type,
      StartPoint startPoint,
      EndPoint endPoint,
      Paint paint,
      String label});

  $StartPointCopyWith<$Res> get startPoint;
  $EndPointCopyWith<$Res> get endPoint;
  $PaintCopyWith<$Res> get paint;
}

/// @nodoc
class _$DrawingCopyWithImpl<$Res, $Val extends Drawing>
    implements $DrawingCopyWith<$Res> {
  _$DrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startPoint = null,
    Object? endPoint = null,
    Object? paint = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      startPoint: null == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as StartPoint,
      endPoint: null == endPoint
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as EndPoint,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StartPointCopyWith<$Res> get startPoint {
    return $StartPointCopyWith<$Res>(_value.startPoint, (value) {
      return _then(_value.copyWith(startPoint: value) as $Val);
    });
  }

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EndPointCopyWith<$Res> get endPoint {
    return $EndPointCopyWith<$Res>(_value.endPoint, (value) {
      return _then(_value.copyWith(endPoint: value) as $Val);
    });
  }

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaintCopyWith<$Res> get paint {
    return $PaintCopyWith<$Res>(_value.paint, (value) {
      return _then(_value.copyWith(paint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DrawingImplCopyWith<$Res> implements $DrawingCopyWith<$Res> {
  factory _$$DrawingImplCopyWith(
          _$DrawingImpl value, $Res Function(_$DrawingImpl) then) =
      __$$DrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      StartPoint startPoint,
      EndPoint endPoint,
      Paint paint,
      String label});

  @override
  $StartPointCopyWith<$Res> get startPoint;
  @override
  $EndPointCopyWith<$Res> get endPoint;
  @override
  $PaintCopyWith<$Res> get paint;
}

/// @nodoc
class __$$DrawingImplCopyWithImpl<$Res>
    extends _$DrawingCopyWithImpl<$Res, _$DrawingImpl>
    implements _$$DrawingImplCopyWith<$Res> {
  __$$DrawingImplCopyWithImpl(
      _$DrawingImpl _value, $Res Function(_$DrawingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startPoint = null,
    Object? endPoint = null,
    Object? paint = null,
    Object? label = null,
  }) {
    return _then(_$DrawingImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      startPoint: null == startPoint
          ? _value.startPoint
          : startPoint // ignore: cast_nullable_to_non_nullable
              as StartPoint,
      endPoint: null == endPoint
          ? _value.endPoint
          : endPoint // ignore: cast_nullable_to_non_nullable
              as EndPoint,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrawingImpl implements _Drawing {
  const _$DrawingImpl(
      {required this.type,
      required this.startPoint,
      required this.endPoint,
      required this.paint,
      required this.label});

  factory _$DrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrawingImplFromJson(json);

  @override
  final String type;
  @override
  final StartPoint startPoint;
  @override
  final EndPoint endPoint;
  @override
  final Paint paint;
  @override
  final String label;

  @override
  String toString() {
    return 'Drawing(type: $type, startPoint: $startPoint, endPoint: $endPoint, paint: $paint, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawingImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startPoint, startPoint) ||
                other.startPoint == startPoint) &&
            (identical(other.endPoint, endPoint) ||
                other.endPoint == endPoint) &&
            (identical(other.paint, paint) || other.paint == paint) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, startPoint, endPoint, paint, label);

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawingImplCopyWith<_$DrawingImpl> get copyWith =>
      __$$DrawingImplCopyWithImpl<_$DrawingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrawingImplToJson(
      this,
    );
  }
}

abstract class _Drawing implements Drawing {
  const factory _Drawing(
      {required final String type,
      required final StartPoint startPoint,
      required final EndPoint endPoint,
      required final Paint paint,
      required final String label}) = _$DrawingImpl;

  factory _Drawing.fromJson(Map<String, dynamic> json) = _$DrawingImpl.fromJson;

  @override
  String get type;
  @override
  StartPoint get startPoint;
  @override
  EndPoint get endPoint;
  @override
  Paint get paint;
  @override
  String get label;

  /// Create a copy of Drawing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrawingImplCopyWith<_$DrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
