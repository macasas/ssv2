
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/base/no_account_machine.dart';


part 'register_screen_notifier.g.dart';

@riverpod
class RegisterScreenNotifier extends _$RegisterScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  bool hasAccount(bool exists) {
    return exists;
  }

  void registerButtonPressed(WidgetRef ref) {
    ref.read(noAccountMachineProvider).fire(NoACCmE.register);
  }
  void cancelButtonPressed(WidgetRef ref) {
    ref.read(noAccountMachineProvider).fire(NoACCmE.cancel);
  }
}
