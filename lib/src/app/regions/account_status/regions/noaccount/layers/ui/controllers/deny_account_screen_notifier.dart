
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// MACHINE
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/base/no_account_machine.dart';


part 'deny_account_screen_notifier.g.dart';

@riverpod
class DenyAccountScreenNotifier extends _$DenyAccountScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  bool hasAccount(bool exists) {
    return exists;
  }

  void backButtonPressed(WidgetRef ref) {
    ref.read(noAccountMachineProvider).fire(NoACCmE.register);
  }

}
