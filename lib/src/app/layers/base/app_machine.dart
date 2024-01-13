/*
 * 1 Machine Initials e.g. R = Rms
 * 2 Machine Name e.g. root
 * 3 Initial state name
 * 
 */
// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// REGIONAL MACHINES
// import 'package:ssv2/src/app/regions/_app_startup_region.dart';
// import 'package:ssv2/src/app/regions/_app_foreground_region.dart';
// import 'package:ssv2/src/app/regions/_app_background_region.dart';
import 'package:ssv2/src/app/regions/app_account_status_region.dart';
import 'package:ssv2/src/app/regions/app_activity_status_region.dart';
import 'package:ssv2/src/app/regions/app_auth_status_region.dart';

enum AmS {
  init,
  accountStatus,
  authStatus,
  activityStatus,
  // appAccountStatusNewAccount,
  // appAccountStatusOldAccount,
  // appAuthStatusAlreadySignedIn,
  // appAuthStatusJustSignedIn,
}

enum AmE { 
  checkAccountStatus,
  checkAuthStatus,
  checkAuthStatusWithNewAccount,
  checkAuthStatusWithOldAccount,
  // checkActivityStatusSignedIn,
  checkActivityStatus,
}

enum AmT { 
  toAccountStatus,
  toAuthStatus,
  toAuthStatusNewAccount,
  toAuthStatusOldAccount,
  toActivityStatus,
  // toAppActivityStatusAlreadySignedIn,
  // toAppActivityStatusJustSignedIn,
}

final appMachineProvider = Provider((ref) {

  final appAccountRegion = ref.read(appAccountStatusRegionProvider);
  final appAuthRegion = ref.read(appAuthStatusRegionProvider);
  final appActivityRegion = ref.read(appActivityStatusRegionProvider);

  final appMachine = StateMachineWithChangeNotifier<AmS, AmE, AmT>(
    events: AmE.values,
    name: 'app',
    initialStateId: AmS.init,
    states: {
      AmS.init: State(
        etm: {
          AmE.checkAccountStatus: [AmT.toAccountStatus],
        },
      ),
      AmS.accountStatus: State(
        etm: {
          AmE.checkAuthStatus: [AmT.toAuthStatus],
          AmE.checkAuthStatusWithNewAccount: [AmT.toAuthStatusNewAccount],
          AmE.checkAuthStatusWithOldAccount: [AmT.toAuthStatusOldAccount],
        },
        regions: [
          appAccountRegion,
        ],
      ),
      AmS.authStatus: State(
        etm: {
          AmE.checkActivityStatus: [AmT.toActivityStatus],
        },
        regions: [
          appAuthRegion,
        ],
      ),
      AmS.activityStatus: State(
        regions: [
          appActivityRegion
        ],
      ),
    },
    transitions: {
      AmT.toAccountStatus: Transition(to: AmS.accountStatus),
      AmT.toAuthStatusNewAccount: Transition(to: AmS.authStatus),
      AmT.toAuthStatusOldAccount: Transition(to: AmS.authStatus),
      AmT.toAuthStatus: Transition(to: AmS.authStatus),   
      AmT.toActivityStatus: Transition(to: AmS.activityStatus),
    },
  );
  return appMachine;
});