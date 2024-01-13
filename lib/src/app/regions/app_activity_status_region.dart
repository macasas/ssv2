import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

// MACHINES
import 'package:ssv2/src/app/layers/base/app_machine.dart';
import 'package:ssv2/src/app/regions/activity_status/layers/base/activity_status_machine.dart';

final appActivityStatusRegionProvider = Provider((ref) {
  
  final activityStatusMachine = ref.read(activityStatusMachineProvider);
  
  return Region<AmS, AmE, AmT, ActSTmS>(
    machine: activityStatusMachine,
    entryConnectors: {
      Trigger(
        source: AmS.accountStatus,
        event: AmE.checkAuthStatusWithNewAccount,
        transition: AmT.toAuthStatusNewAccount
      ) : ActSTmS.epSignedIn,
      Trigger(
        source: AmS.accountStatus,
        event: AmE.checkAuthStatusWithOldAccount,
        transition: AmT.toAuthStatusOldAccount
      ) : ActSTmS.epSignedIn,
    },
  );

});