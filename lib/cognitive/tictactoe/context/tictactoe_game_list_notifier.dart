import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_data_model.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_game_model.dart';

class TicTacToeGameListNotifier
    extends BaseGameListNotifier<TicTacToeDataModel, TicTacToeGameModel> {
  TicTacToeGameListNotifier({List<TicTacToeDataModel>? initialState})
      : super(initialState);

  @override
  TicTacToeDataModel mapGameModelToDataModel(TicTacToeGameModel model) =>
      TicTacToeDataModel(
          status: model.status,
          startTime: model.startTime,
          endTime: model.endTime,
          minResponseTime: model.minResponseTime,
          maxResponseTime: model.maxResponseTime,
          avgResponseTime: model.avgResponseTime,
          player: model.player,
          firstPlayer: model.firstPlayer);
}
