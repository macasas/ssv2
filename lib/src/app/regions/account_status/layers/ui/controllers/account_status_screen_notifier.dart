
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ssv2/src/app/regions/account_status/layers/base/account_status_machine.dart';

part 'account_status_screen_notifier.g.dart';

@riverpod
class AccountStatusScreenNotifier extends _$AccountStatusScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  bool hasAccount(bool exists) {
    return exists;
  }

  void continuedButtonPressed(WidgetRef ref) {
    ref.read(accountStatusMachineProvider).fire(AccSTmE.evExitWithOldAccount);
  }

}
