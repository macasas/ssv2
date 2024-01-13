
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/base/no_account_machine.dart';


part 'confirm_account_screen_notifier.g.dart';

@riverpod
class ConfirmAccountScreenNotifier extends _$ConfirmAccountScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  bool accountCreated(bool created) {
    return created;
  }

  void successButtonPressed(WidgetRef ref) {
    ref.read(noAccountMachineProvider).fire(NoACCmE.success);
  }

}
