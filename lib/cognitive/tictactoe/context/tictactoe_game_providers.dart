import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_list_notifier.dart';
import 'package:epsycheart/cognitive/tictactoe/context/tictactoe_game_notifier.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_data_model.dart';
import 'package:epsycheart/cognitive/tictactoe/models/tictactoe_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ticTacToeGameProvider =
    StateNotifierProvider<TicTacToeGameNotifier, TicTacToeGameModel>(
        (ref) => TicTacToeGameNotifier(ref, ticTacToeGameListProvider));

final ticTacToeGameListProvider =
    StateNotifierProvider<TicTacToeGameListNotifier, List<TicTacToeDataModel>>(
        (ref) => TicTacToeGameListNotifier());
