import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_data_model.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_model.dart';

class FindWordGameListNotifier
    extends BaseGameListNotifier<FindWordGameDataModel, FindWordGameModel> {
  FindWordGameListNotifier({List<FindWordGameDataModel>? initialState})
      : super(initialState);

  @override
  FindWordGameDataModel mapGameModelToDataModel(FindWordGameModel model) =>
      FindWordGameDataModel(
          status: model.status,
          startTime: model.startTime,
          endTime: model.endTime,
          minResponseTime: model.minResponseTime,
          maxResponseTime: model.maxResponseTime,
          avgResponseTime: model.avgResponseTime,
          columns: model.columns,
          rows: model.rows,
          words: [...model.words]);
}
