// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beans_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeansDataModel {
  GameStatusType get status => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  double? get minResponseTime => throw _privateConstructorUsedError;
  double? get maxResponseTime => throw _privateConstructorUsedError;
  double? get avgResponseTime => throw _privateConstructorUsedError;
  Color? get targetColor => throw _privateConstructorUsedError;
  Color? get selectedColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeansDataModelCopyWith<BeansDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeansDataModelCopyWith<$Res> {
  factory $BeansDataModelCopyWith(
          BeansDataModel value, $Res Function(BeansDataModel) then) =
      _$BeansDataModelCopyWithImpl<$Res>;
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      Color? targetColor,
      Color? selectedColor});
}

/// @nodoc
class _$BeansDataModelCopyWithImpl<$Res>
    implements $BeansDataModelCopyWith<$Res> {
  _$BeansDataModelCopyWithImpl(this._value, this._then);

  final BeansDataModel _value;
  // ignore: unused_field
  final $Res Function(BeansDataModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? targetColor = freezed,
    Object? selectedColor = freezed,
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
      targetColor: targetColor == freezed
          ? _value.targetColor
          : targetColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      selectedColor: selectedColor == freezed
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
abstract class _$BeansDataModelCopyWith<$Res>
    implements $BeansDataModelCopyWith<$Res> {
  factory _$BeansDataModelCopyWith(
          _BeansDataModel value, $Res Function(_BeansDataModel) then) =
      __$BeansDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      Color? targetColor,
      Color? selectedColor});
}

/// @nodoc
class __$BeansDataModelCopyWithImpl<$Res>
    extends _$BeansDataModelCopyWithImpl<$Res>
    implements _$BeansDataModelCopyWith<$Res> {
  __$BeansDataModelCopyWithImpl(
      _BeansDataModel _value, $Res Function(_BeansDataModel) _then)
      : super(_value, (v) => _then(v as _BeansDataModel));

  @override
  _BeansDataModel get _value => super._value as _BeansDataModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? targetColor = freezed,
    Object? selectedColor = freezed,
  }) {
    return _then(_BeansDataModel(
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
      targetColor: targetColor == freezed
          ? _value.targetColor
          : targetColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      selectedColor: selectedColor == freezed
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_BeansDataModel implements _BeansDataModel {
  const _$_BeansDataModel(
      {this.status = GameStatusType.none,
      this.startTime,
      this.endTime,
      this.minResponseTime,
      this.maxResponseTime,
      this.avgResponseTime,
      this.targetColor,
      this.selectedColor});

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
  final Color? targetColor;
  @override
  final Color? selectedColor;

  @override
  String toString() {
    return 'BeansDataModel(status: $status, startTime: $startTime, endTime: $endTime, minResponseTime: $minResponseTime, maxResponseTime: $maxResponseTime, avgResponseTime: $avgResponseTime, targetColor: $targetColor, selectedColor: $selectedColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeansDataModel &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.minResponseTime, minResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.maxResponseTime, maxResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.avgResponseTime, avgResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.targetColor, targetColor) &&
            const DeepCollectionEquality()
                .equals(other.selectedColor, selectedColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(minResponseTime),
      const DeepCollectionEquality().hash(maxResponseTime),
      const DeepCollectionEquality().hash(avgResponseTime),
      const DeepCollectionEquality().hash(targetColor),
      const DeepCollectionEquality().hash(selectedColor));

  @JsonKey(ignore: true)
  @override
  _$BeansDataModelCopyWith<_BeansDataModel> get copyWith =>
      __$BeansDataModelCopyWithImpl<_BeansDataModel>(this, _$identity);
}

abstract class _BeansDataModel implements BeansDataModel, BaseGameModel {
  const factory _BeansDataModel(
      {final GameStatusType status,
      final DateTime? startTime,
      final DateTime? endTime,
      final double? minResponseTime,
      final double? maxResponseTime,
      final double? avgResponseTime,
      final Color? targetColor,
      final Color? selectedColor}) = _$_BeansDataModel;

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
  Color? get targetColor => throw _privateConstructorUsedError;
  @override
  Color? get selectedColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BeansDataModelCopyWith<_BeansDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
