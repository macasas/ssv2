
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';


part 'forgot_screen_notifier.g.dart';

@riverpod
class ForgotScreenNotifier extends _$ForgotScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void resetButtonPressed(WidgetRef ref) {
    ref.read(signedOutMachineProvider).fire(SOUTmE.reset);
  }
  void cancelButtonPressed(WidgetRef ref) {
    ref.read(signedOutMachineProvider).fire(SOUTmE.cancelReset);
  }
}
