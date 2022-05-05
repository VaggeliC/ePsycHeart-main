import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/tictactoe/types/tictactoe_player_type.dart';
import 'package:epsycheart/cognitive/tictactoe/utilities/tictactoe_utilities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tictactoe_game_model.freezed.dart';

@freezed
class TicTacToeGameModel with BaseGameModel, _$TicTacToeGameModel {
  @Implements<BaseGameModel>()
  const factory TicTacToeGameModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      @Default(TicTacToePlayerType.none) TicTacToePlayerType player,
      @Default(TicTacToePlayerType.none) TicTacToePlayerType firstPlayer,
      @Default(ticTacToeDefaultBoard) List<TicTacToePlayerType> board,
      @Default(TicTacToePlayerType.none) TicTacToePlayerType playerTurn,
      DateTime? startResponseTime}) = _TicTacToeGameModel;
}
