import 'package:epsycheart/cognitive/beans/context/beans_game_list_notifier.dart';
import 'package:epsycheart/cognitive/beans/context/beans_game_notifier.dart';
import 'package:epsycheart/cognitive/beans/models/beans_data_model.dart';
import 'package:epsycheart/cognitive/beans/models/beans_game_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beansGameProvider =
    StateNotifierProvider<BeansGameNotifier, BeansGameModel>(
        (ref) => BeansGameNotifier(ref, beansGameListProvider));

final beansGameListProvider =
    StateNotifierProvider<BeansGameListNotifier, List<BeansDataModel>>(
        (ref) => BeansGameListNotifier());
