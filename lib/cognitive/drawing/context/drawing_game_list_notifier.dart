import 'package:epsycheart/cognitive/common/models/base_game_list_notifier.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_data_model.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_game_model.dart';

class DrawingGameListNotifier
    extends BaseGameListNotifier<DrawingDataModel, DrawingGameModel> {
  DrawingGameListNotifier({List<DrawingDataModel>? initialState})
      : super(initialState);

  @override
  DrawingDataModel mapGameModelToDataModel(DrawingGameModel model) {
    // TODO: implement mapGameModelToDataModel
    throw UnimplementedError();
  }
}
