import 'package:epsycheart/cognitive/beans/models/beans_data_model.dart';
import 'package:epsycheart/cognitive/beans/models/beans_game_model.dart';
import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';

class BeansGameListNotifier
    extends BaseGameListNotifier<BeansDataModel, BeansGameModel> {
  BeansGameListNotifier({List<BeansDataModel>? initialState})
      : super(initialState);

  @override
  BeansDataModel mapGameModelToDataModel(BeansGameModel model) =>
      BeansDataModel(
          status: model.status,
          startTime: model.startTime,
          endTime: model.endTime,
          minResponseTime: model.minResponseTime,
          maxResponseTime: model.maxResponseTime,
          avgResponseTime: model.avgResponseTime,
          selectedColor: model.selectedColor,
          targetColor: model.targetColor);
}
