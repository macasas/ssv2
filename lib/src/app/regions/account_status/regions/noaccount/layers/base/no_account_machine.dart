// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';


enum NoACCmS { 
  register,
  confirmAccount,
  denyAccount,
  exNewAccount,
  exCancelled
}

enum NoACCmE { 
  register,
  cancel,
  denied,
  success,
  newuser
}

enum NoACCmT { 
  toRegister,
  toConfirmAccount,
  toDenyAccount,
  toExCancelled,
  toExNewAccount
}


final noAccountMachineProvider = Provider((ref) {
  
  final noAccountMachine = StateMachineWithChangeNotifier<NoACCmS, NoACCmE, NoACCmT>(
    events: NoACCmE.values,
    name: 'noAccount',
    initialStateId: NoACCmS.register,
    states: {
      NoACCmS.register: State(
        etm: {
          NoACCmE.register: [NoACCmT.toConfirmAccount],
          NoACCmE.cancel: [NoACCmT.toExCancelled]
        },
      ),
      NoACCmS.confirmAccount: State(
        etm: {
          NoACCmE.success: [NoACCmT.toExNewAccount]
        },
      ),
      NoACCmS.denyAccount: State(
        etm: {
          NoACCmE.denied: [NoACCmT.toRegister]
        },
      ),
      NoACCmS.exNewAccount: ExitPoint(),
      NoACCmS.exCancelled: ExitPoint(),
    },
    transitions: {
      NoACCmT.toRegister: Transition(to: NoACCmS.register),
      NoACCmT.toConfirmAccount: Transition(to: NoACCmS.confirmAccount),
      NoACCmT.toDenyAccount: Transition(to: NoACCmS.denyAccount),
      NoACCmT.toExNewAccount: Transition(to: NoACCmS.exNewAccount),
      NoACCmT.toExCancelled: Transition(to: NoACCmS.exCancelled),
    },
  );
  return noAccountMachine;
});
