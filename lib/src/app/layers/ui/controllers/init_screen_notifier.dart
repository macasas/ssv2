
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ssv2/src/app/layers/base/app_machine.dart';

part 'init_screen_notifier.g.dart';

@riverpod
class InitScreenNotifier extends _$InitScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void startButtonPressed(WidgetRef ref) {
    ref.read(appMachineProvider).fire(AmE.checkAccountStatus);
  }

}
