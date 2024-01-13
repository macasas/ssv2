import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';

// MACHINES

final authStatusSignedOutRegionProvider = Provider((ref) {
  
  final signedOutMachine = ref.read(signedOutMachineProvider);
  
  return Region<AuthSTmS, AuthSTmE, AuthSTmT, SOUTmS>(
    machine: signedOutMachine,   
    entryConnectors: {
      Trigger(
        source: AuthSTmS.signinCancelled,
        event: AuthSTmE.evSignin,
        transition: AuthSTmT.toSignedOut
      ) : SOUTmS.epRetrySignin,
    },
    exitConnectors: {
      SOUTmS.exSignedIn: AuthSTmE.evSignedin,
      SOUTmS.exCancelled: AuthSTmE.evCancelSignin
    }
  );

});