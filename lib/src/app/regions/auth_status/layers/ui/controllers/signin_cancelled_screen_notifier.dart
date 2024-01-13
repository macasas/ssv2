
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';


part 'signin_cancelled_screen_notifier.g.dart';

@riverpod
class SigninCancelledScreenNotifier extends _$SigninCancelledScreenNotifier {

  @override
  bool build() {
    // no state
    return false;
  }

  void retryButtonPressed(WidgetRef ref) {
    ref.read(authStatusMachineProvider).fire(AuthSTmE.evSignin);
  }

}
