// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';
import 'package:ssv2/src/app/regions/account_status/regions/account_status_noaccount_region.dart';



enum AccSTmS { 
  accountStatus,
  account,
  noAccount,
  cancelledRegistration,
  exNewAccount,
  exOldAccount
}

enum AccSTmE { 
  // evCheckAccountStatus,
  account,
  noaccount,
  // evRegister,
  // evForward,
  evCancelledRegistration,
  evExitWithNewAccount,
  evExitWithOldAccount
}

enum AccSTmT { 
  toAccount,
  toNoAccount,
  toCancelledRegistration,
  toExNewAccount,
  toExOldAccount
}


final accountStatusMachineProvider = Provider((ref) {
  
  final accountStatusNoAccountRegion = ref.read(accountStatusNoAccountRegionProvider);

  final accountStatusMachine = StateMachineWithChangeNotifier<AccSTmS, AccSTmE, AccSTmT>(
    events: AccSTmE.values,
    name: 'accountStatus',
    initialStateId: AccSTmS.accountStatus,
    states: {
      AccSTmS.accountStatus: State(
        etm: {
          AccSTmE.noaccount: [AccSTmT.toNoAccount],
          AccSTmE.account: [AccSTmT.toAccount],
          AccSTmE.evCancelledRegistration: [AccSTmT.toCancelledRegistration],
        },
        onEntry: Action(
          description: 'check for existence of account',
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AccountStatus.accountStatus.onEntry");
            print("Check existance of user account");
            const bool accountExists = true;

            if (accountExists == false) {
              machine.fire(AccSTmE.noaccount);
            } else {
              machine.fire(AccSTmE.account);
            }
            
          },
        ),
      ),
      AccSTmS.noAccount: State(
        etm: {
          AccSTmE.evExitWithNewAccount: [AccSTmT.toExNewAccount],
        },
        onEntry: Action(
          description: "AccountStatus.noaccount.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AccountStatus.noaccount.onEntry - Register a new user account");
          },
        ),
        regions: [
          accountStatusNoAccountRegion
        ],
      ),
      AccSTmS.account: State(
        etm: {
          AccSTmE.evExitWithOldAccount: [AccSTmT.toExOldAccount],
        },
        onEntry: Action(
          description: "AccountStatus.account.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AccountStatus.account.onEntry - Update user account");
          },
        ),
      ),
      AccSTmS.exNewAccount: ExitPoint(),
      AccSTmS.exOldAccount: ExitPoint(),
    },
    transitions: {
      AccSTmT.toAccount: Transition(to: AccSTmS.account),
      AccSTmT.toNoAccount: Transition(to: AccSTmS.noAccount),
      AccSTmT.toExNewAccount: Transition(to: AccSTmS.exNewAccount),
      AccSTmT.toExOldAccount: Transition(to: AccSTmS.exOldAccount),
    },
  );
  return accountStatusMachine;
});
