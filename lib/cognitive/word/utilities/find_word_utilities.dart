import 'package:epsycheart/cognitive/common/types/game_status_type.dart';

String findWordGetGameStatusText(GameStatusType status) {
  switch (status) {
    case GameStatusType.won:
      return 'cognitive.gameWord.winText';
    case GameStatusType.lost:
      return 'cognitive.gameWord.lostText';
    default:
      return '';
  }
}
