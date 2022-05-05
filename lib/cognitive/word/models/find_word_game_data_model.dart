import 'package:epsycheart/cognitive/common/models/base_game_model.dart';
import 'package:epsycheart/cognitive/common/types/game_status_type.dart';
import 'package:epsycheart/cognitive/word/utilities/find_word_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_word_game_data_model.freezed.dart';

@freezed
class FindWordGameDataModel with BaseGameModel, _$FindWordGameDataModel {
  @Implements<BaseGameModel>()
  const factory FindWordGameDataModel(
      {@Default(GameStatusType.none) GameStatusType status,
      DateTime? startTime,
      DateTime? endTime,
      double? minResponseTime,
      double? maxResponseTime,
      double? avgResponseTime,
      @Default(findWordDefaultRows) int rows,
      @Default(findWordDefaultColumns) int columns,
      @Default([]) List<String> words}) = _FindWordGameDataModel;
}
