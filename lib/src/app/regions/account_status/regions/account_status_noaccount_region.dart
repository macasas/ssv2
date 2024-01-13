import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

// MACHINES
import 'package:ssv2/src/app/regions/account_status/layers/base/account_status_machine.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/base/no_account_machine.dart';

final accountStatusNoAccountRegionProvider = Provider((ref) {
  
  final noAccountMachine = ref.read(noAccountMachineProvider);
  
  return Region<AccSTmS, AccSTmE, AccSTmT, NoACCmS>(
    machine: noAccountMachine,
    exitConnectors: {
      NoACCmS.exNewAccount: AccSTmE.evExitWithNewAccount,
      NoACCmS.exCancelled: AccSTmE.evCancelledRegistration
    },

  );

});