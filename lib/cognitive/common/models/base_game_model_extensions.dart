import 'package:epsycheart/cognitive/common/models/base_game_model.dart';

extension BaseGameModelExtension<T extends BaseGameModel> on T {
  int gameTimeInMSecs() => endTime != null
      ? endTime!.difference(startTime ?? endTime!).inMilliseconds
      : 0;
}
