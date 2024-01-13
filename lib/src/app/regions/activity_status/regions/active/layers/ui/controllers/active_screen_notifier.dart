
// ignore_for_file: avoid_print

import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/base/active_machine.dart';

part 'active_screen_notifier.g.dart';

@riverpod
class ActiveScreenNotifier extends _$ActiveScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void progressButtonPressed(WidgetRef ref) {
    ref.read(activeMachineProvider).fire(ACTmE.showProgress);
  }
  void profileButtonPressed(WidgetRef ref) {
    ref.read(activeMachineProvider).fire(ACTmE.showProfile);
  }
  void settingsButtonPressed(WidgetRef ref) {
    print('call settings page');
    //ref.read(activeMachineProvider).fire(ACTmE.showSettings);
  }
  void courseButtonPressed(WidgetRef ref) {
    ref.read(activeMachineProvider).fire(ACTmE.showCourse);
  }
}
