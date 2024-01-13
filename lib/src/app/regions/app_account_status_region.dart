import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

// MACHINES
import 'package:ssv2/src/app/layers/base/app_machine.dart';
import 'package:ssv2/src/app/regions/account_status/layers/base/account_status_machine.dart';

final appAccountStatusRegionProvider = Provider((ref) {
  
  final accountStatusMachine = ref.read(accountStatusMachineProvider);
  
  return Region<AmS, AmE, AmT, AccSTmS>(
    machine: accountStatusMachine,
    exitConnectors: {
      AccSTmS.exNewAccount: AmE.checkAuthStatusWithNewAccount,
      AccSTmS.exOldAccount: AmE.checkAuthStatusWithOldAccount

      // AccSTmS.exNewAccount: AmE.checkAuthStatus,
      // AccSTmS.exOldAccount: AmE.checkAuthStatus
    },
  );

});