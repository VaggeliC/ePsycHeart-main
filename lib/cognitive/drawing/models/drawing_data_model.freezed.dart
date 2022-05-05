// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drawing_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawingDataModel {
  GameStatusType get status => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  double? get minResponseTime => throw _privateConstructorUsedError;
  double? get maxResponseTime => throw _privateConstructorUsedError;
  double? get avgResponseTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawingDataModelCopyWith<DrawingDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawingDataModelCopyWith<$Res> {
  factory $DrawingDataModelCopyWith(
          DrawingDataModel value, $Res Function(DrawingDataModel) then) =
      _$DrawingDataModelCopyWithImpl<$Res>;
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime});
}

/// @nodoc
class _$DrawingDataModelCopyWithImpl<$Res>
    implements $DrawingDataModelCopyWith<$Res> {
  _$DrawingDataModelCopyWithImpl(this._value, this._then);

  final DrawingDataModel _value;
  // ignore: unused_field
  final $Res Function(DrawingDataModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusType,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minResponseTime: minResponseTime == freezed
          ? _value.minResponseTime
          : minResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseTime: maxResponseTime == freezed
          ? _value.maxResponseTime
          : maxResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseTime: avgResponseTime == freezed
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$DrawingDataModelCopyWith<$Res>
    implements $DrawingDataModelCopyWith<$Res> {
  factory _$DrawingDataModelCopyWith(
          _DrawingDataModel value, $Res Function(_DrawingDataModel) then) =
      __$DrawingDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime});
}

/// @nodoc
class __$DrawingDataModelCopyWithImpl<$Res>
    extends _$DrawingDataModelCopyWithImpl<$Res>
    implements _$DrawingDataModelCopyWith<$Res> {
  __$DrawingDataModelCopyWithImpl(
      _DrawingDataModel _value, $Res Function(_DrawingDataModel) _then)
      : super(_value, (v) => _then(v as _DrawingDataModel));

  @override
  _DrawingDataModel get _value => super._value as _DrawingDataModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
  }) {
    return _then(_DrawingDataModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatusType,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minResponseTime: minResponseTime == freezed
          ? _value.minResponseTime
          : minResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      maxResponseTime: maxResponseTime == freezed
          ? _value.maxResponseTime
          : maxResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
      avgResponseTime: avgResponseTime == freezed
          ? _value.avgResponseTime
          : avgResponseTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_DrawingDataModel implements _DrawingDataModel {
  const _$_DrawingDataModel(
      {this.status = GameStatusType.none,
      this.startTime,
      this.endTime,
      this.minResponseTime,
      this.maxResponseTime,
      this.avgResponseTime});

  @override
  @JsonKey()
  final GameStatusType status;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final double? minResponseTime;
  @override
  final double? maxResponseTime;
  @override
  final double? avgResponseTime;

  @override
  String toString() {
    return 'DrawingDataModel(status: $status, startTime: $startTime, endTime: $endTime, minResponseTime: $minResponseTime, maxResponseTime: $maxResponseTime, avgResponseTime: $avgResponseTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrawingDataModel &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.minResponseTime, minResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.maxResponseTime, maxResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.avgResponseTime, avgResponseTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(minResponseTime),
      const DeepCollectionEquality().hash(maxResponseTime),
      const DeepCollectionEquality().hash(avgResponseTime));

  @JsonKey(ignore: true)
  @override
  _$DrawingDataModelCopyWith<_DrawingDataModel> get copyWith =>
      __$DrawingDataModelCopyWithImpl<_DrawingDataModel>(this, _$identity);
}

abstract class _DrawingDataModel implements DrawingDataModel, BaseGameModel {
  const factory _DrawingDataModel(
      {final GameStatusType status,
      final DateTime? startTime,
      final DateTime? endTime,
      final double? minResponseTime,
      final double? maxResponseTime,
      final double? avgResponseTime}) = _$_DrawingDataModel;

  @override
  GameStatusType get status => throw _privateConstructorUsedError;
  @override
  DateTime? get startTime => throw _privateConstructorUsedError;
  @override
  DateTime? get endTime => throw _privateConstructorUsedError;
  @override
  double? get minResponseTime => throw _privateConstructorUsedError;
  @override
  double? get maxResponseTime => throw _privateConstructorUsedError;
  @override
  double? get avgResponseTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DrawingDataModelCopyWith<_DrawingDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
