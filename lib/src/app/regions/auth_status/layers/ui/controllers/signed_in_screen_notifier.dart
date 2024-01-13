
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';


part 'signed_in_screen_notifier.g.dart';

@riverpod
class SignedInScreenNotifier extends _$SignedInScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void signinButtonPressed(WidgetRef ref) {
    ref.read(authStatusMachineProvider).fire(AuthSTmE.evSignin);
  }
  void signoutButtonPressed(WidgetRef ref) {
    ref.read(authStatusMachineProvider).fire(AuthSTmE.evSignout);
  }
  void alreadySignedInButtonPressed(WidgetRef ref) {
    ref.read(authStatusMachineProvider).fire(AuthSTmE.evExit);
  }
}
