import 'package:epsycheart/cognitive/word/context/find_word_game_list_notifier.dart';
import 'package:epsycheart/cognitive/word/context/find_word_game_notifier.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_data_model.dart';
import 'package:epsycheart/cognitive/word/models/find_word_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final findWordGameProvider =
    StateNotifierProvider<FindWordGameNotifier, FindWordGameModel>(
        (ref) => FindWordGameNotifier(ref, findWordGameListProvider));

final findWordGameListProvider = StateNotifierProvider<FindWordGameListNotifier,
    List<FindWordGameDataModel>>((ref) => FindWordGameListNotifier());
