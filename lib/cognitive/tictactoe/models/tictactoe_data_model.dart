import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tictactoe_data_model.freezed.dart';

@freezed
class TicTacToeDataModel with BaseGameModel, _$TicTacToeDataModel {
  @Implements<BaseGameModel>()
  const factory TicTacToeDataModel({
    @Default(GameStatusType.none) GameStatusType status,
    DateTime? startTime,
    DateTime? endTime,
    double? minResponseTime,
    double? maxResponseTime,
    double? avgResponseTime,
    @Default(TicTacToePlayerType.none) TicTacToePlayerType player,
    @Default(TicTacToePlayerType.none) TicTacToePlayerType firstPlayer,
  }) = _TicTacToeDataModel;
}
