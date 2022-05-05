// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tictactoe_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicTacToeDataModel {
  GameStatusType get status => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  double? get minResponseTime => throw _privateConstructorUsedError;
  double? get maxResponseTime => throw _privateConstructorUsedError;
  double? get avgResponseTime => throw _privateConstructorUsedError;
  TicTacToePlayerType get player => throw _privateConstructorUsedError;
  TicTacToePlayerType get firstPlayer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicTacToeDataModelCopyWith<TicTacToeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicTacToeDataModelCopyWith<$Res> {
  factory $TicTacToeDataModelCopyWith(
          TicTacToeDataModel value, $Res Function(TicTacToeDataModel) then) =
      _$TicTacToeDataModelCopyWithImpl<$Res>;
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      TicTacToePlayerType player,
      TicTacToePlayerType firstPlayer});
}

/// @nodoc
class _$TicTacToeDataModelCopyWithImpl<$Res>
    implements $TicTacToeDataModelCopyWith<$Res> {
  _$TicTacToeDataModelCopyWithImpl(this._value, this._then);

  final TicTacToeDataModel _value;
  // ignore: unused_field
  final $Res Function(TicTacToeDataModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? player = freezed,
    Object? firstPlayer = freezed,
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
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
      firstPlayer: firstPlayer == freezed
          ? _value.firstPlayer
          : firstPlayer // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
    ));
  }
}

/// @nodoc
abstract class _$TicTacToeDataModelCopyWith<$Res>
    implements $TicTacToeDataModelCopyWith<$Res> {
  factory _$TicTacToeDataModelCopyWith(
          _TicTacToeDataModel value, $Res Function(_TicTacToeDataModel) then) =
      __$TicTacToeDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      TicTacToePlayerType player,
      TicTacToePlayerType firstPlayer});
}

/// @nodoc
class __$TicTacToeDataModelCopyWithImpl<$Res>
    extends _$TicTacToeDataModelCopyWithImpl<$Res>
    implements _$TicTacToeDataModelCopyWith<$Res> {
  __$TicTacToeDataModelCopyWithImpl(
      _TicTacToeDataModel _value, $Res Function(_TicTacToeDataModel) _then)
      : super(_value, (v) => _then(v as _TicTacToeDataModel));

  @override
  _TicTacToeDataModel get _value => super._value as _TicTacToeDataModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? minResponseTime = freezed,
    Object? maxResponseTime = freezed,
    Object? avgResponseTime = freezed,
    Object? player = freezed,
    Object? firstPlayer = freezed,
  }) {
    return _then(_TicTacToeDataModel(
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
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
      firstPlayer: firstPlayer == freezed
          ? _value.firstPlayer
          : firstPlayer // ignore: cast_nullable_to_non_nullable
              as TicTacToePlayerType,
    ));
  }
}

/// @nodoc

class _$_TicTacToeDataModel implements _TicTacToeDataModel {
  const _$_TicTacToeDataModel(
      {this.status = GameStatusType.none,
      this.startTime,
      this.endTime,
      this.minResponseTime,
      this.maxResponseTime,
      this.avgResponseTime,
      this.player = TicTacToePlayerType.none,
      this.firstPlayer = TicTacToePlayerType.none});

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
  @JsonKey()
  final TicTacToePlayerType player;
  @override
  @JsonKey()
  final TicTacToePlayerType firstPlayer;

  @override
  String toString() {
    return 'TicTacToeDataModel(status: $status, startTime: $startTime, endTime: $endTime, minResponseTime: $minResponseTime, maxResponseTime: $maxResponseTime, avgResponseTime: $avgResponseTime, player: $player, firstPlayer: $firstPlayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicTacToeDataModel &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality()
                .equals(other.minResponseTime, minResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.maxResponseTime, maxResponseTime) &&
            const DeepCollectionEquality()
                .equals(other.avgResponseTime, avgResponseTime) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality()
                .equals(other.firstPlayer, firstPlayer));
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
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(firstPlayer));

  @JsonKey(ignore: true)
  @override
  _$TicTacToeDataModelCopyWith<_TicTacToeDataModel> get copyWith =>
      __$TicTacToeDataModelCopyWithImpl<_TicTacToeDataModel>(this, _$identity);
}

abstract class _TicTacToeDataModel
    implements TicTacToeDataModel, BaseGameModel {
  const factory _TicTacToeDataModel(
      {final GameStatusType status,
      final DateTime? startTime,
      final DateTime? endTime,
      final double? minResponseTime,
      final double? maxResponseTime,
      final double? avgResponseTime,
      final TicTacToePlayerType player,
      final TicTacToePlayerType firstPlayer}) = _$_TicTacToeDataModel;

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
  TicTacToePlayerType get player => throw _privateConstructorUsedError;
  @override
  TicTacToePlayerType get firstPlayer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TicTacToeDataModelCopyWith<_TicTacToeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
