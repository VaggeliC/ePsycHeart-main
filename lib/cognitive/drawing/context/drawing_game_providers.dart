import 'package:epsycheart/cognitive/drawing/context/drawing_game_list_notifier.dart';
import 'package:epsycheart/cognitive/drawing/context/drawing_game_notifier.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_data_model.dart';
import 'package:epsycheart/cognitive/drawing/models/drawing_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final drawingGameProvider =
    StateNotifierProvider<DrawingGameNotifier, DrawingGameModel>(
        (ref) => DrawingGameNotifier(ref, drawingGameListProvider));

final drawingGameListProvider =
    StateNotifierProvider<DrawingGameListNotifier, List<DrawingDataModel>>(
        (ref) => DrawingGameListNotifier());
