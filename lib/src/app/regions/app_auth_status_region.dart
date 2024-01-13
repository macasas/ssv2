import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

// MACHINES
import 'package:ssv2/src/app/layers/base/app_machine.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';

final appAuthStatusRegionProvider = Provider((ref) {
  
  final authStatusMachine = ref.read(authStatusMachineProvider);
  
  return Region<AmS, AmE, AmT, AuthSTmS>(
    machine: authStatusMachine,
    entryConnectors: {
      Trigger(
        source: AmS.accountStatus,
        event: AmE.checkAuthStatusWithNewAccount,
        transition: AmT.toAuthStatusNewAccount
      ) : AuthSTmS.epNewAccount,
      Trigger(
        source: AmS.accountStatus,
        event: AmE.checkAuthStatusWithOldAccount,
        transition: AmT.toAuthStatusOldAccount
      ) : AuthSTmS.epOldAccount,
    },
    exitConnectors: {
      AuthSTmS.exAlreadySignedIn: AmE.checkActivityStatus,
      AuthSTmS.exJustSignedIn: AmE.checkActivityStatus
    },
  );

});