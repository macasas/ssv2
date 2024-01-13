// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';


enum SOUTmS { 
  epRetrySignin,
  signin,
  confirmSignin,
  forgot,
  exSignedIn,
  exCancelled
}

enum SOUTmE { 
  signin,
  cancelSignin,
  forgot,
  reset,
  cancelReset,
  success,
  failed
}
// failed not used, need some hidden state that signs in
// and comes back with the state.

enum SOUTmT { 
  toSignin,
  toConfirmSignin,
  toForgot,
  toExCancelled,
  toExSignedIn
}


final signedOutMachineProvider = Provider((ref) {
  
  final signedOutMachine = StateMachineWithChangeNotifier<SOUTmS, SOUTmE, SOUTmT>(
    events: SOUTmE.values,
    name: 'signedOut',
    initialStateId: SOUTmS.signin,
    states: {
      SOUTmS.epRetrySignin: EntryPoint([SOUTmT.toSignin]),
      SOUTmS.signin: State(
        etm: {
          SOUTmE.signin: [SOUTmT.toConfirmSignin],
          SOUTmE.cancelSignin: [SOUTmT.toExCancelled],
          SOUTmE.forgot: [SOUTmT.toForgot],
        },
      ),
      SOUTmS.confirmSignin: State(
        etm: {
          SOUTmE.success: [SOUTmT.toExSignedIn]
        },
      ),
      SOUTmS.forgot: State(
        etm: {
          SOUTmE.reset: [SOUTmT.toSignin],
          SOUTmE.cancelReset: [SOUTmT.toSignin]
        },
      ),
      SOUTmS.exSignedIn: ExitPoint(),
      SOUTmS.exCancelled: ExitPoint(),
    },
    transitions: {
      SOUTmT.toSignin: Transition(to: SOUTmS.signin),
      SOUTmT.toConfirmSignin: Transition(to: SOUTmS.confirmSignin),
      SOUTmT.toForgot: Transition(to: SOUTmS.forgot),
      SOUTmT.toExCancelled: Transition(to: SOUTmS.exCancelled),
      SOUTmT.toExSignedIn: Transition(to: SOUTmS.exSignedIn),
    },
  );
  return signedOutMachine;
});
