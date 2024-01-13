
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';


part 'signin_screen_notifier.g.dart';

@riverpod
class SigninScreenNotifier extends _$SigninScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void activateButtonPressed(WidgetRef ref) {
    ref.read(signedOutMachineProvider).fire(SOUTmE.signin);
  }

}