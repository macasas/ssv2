
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/activity_status/layers/base/activity_status_machine.dart';


part 'inactive_screen_notifier.g.dart';

@riverpod
class InactiveScreenNotifier extends _$InactiveScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void activateButtonPressed(WidgetRef ref) {
    ref.read(activityStatusMachineProvider).fire(ActSTmE.evActivate);
  }

}
