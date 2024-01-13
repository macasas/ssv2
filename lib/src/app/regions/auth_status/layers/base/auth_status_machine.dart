// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/authstatus_signedout_region.dart';


enum AuthSTmS { 
  epOldAccount,
  epNewAccount,
  authStatus,
  signedOut,
  signedIn,
  signinCancelled,
  exAlreadySignedIn,
  exJustSignedIn,
}

enum AuthSTmE { 
  evCheckAuthStatus,
  evSignedin,
  evSignin,
  evSignout,
  evCancelSignin,
  evExit
}

enum AuthSTmT { 
  toAuthStatus,
  toSignedOut,
  toSignedIn,
  toSigninCancelled,
  toExAlreadySignedIn,
  toExJustSignedIn
}


final authStatusMachineProvider = Provider((ref) {
  
  final authStatusSignedOutRegion = ref.read(authStatusSignedOutRegionProvider);

  final authStatusMachine = StateMachineWithChangeNotifier<AuthSTmS, AuthSTmE, AuthSTmT>(
    events: AuthSTmE.values,
    name: 'authStatus',
    initialStateId: AuthSTmS.authStatus,
    states: {
      AuthSTmS.epOldAccount: EntryPoint([AuthSTmT.toAuthStatus]),
      AuthSTmS.epNewAccount: EntryPoint([AuthSTmT.toSignedIn]),
      AuthSTmS.authStatus: State(
        etm: {
          AuthSTmE.evSignin: [AuthSTmT.toSignedOut],
          AuthSTmE.evSignedin: [AuthSTmT.toSignedIn],
        },
        onEntry: Action(
          description: 'check auth status',
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AuthStatus.authStatus.onEntry");
            print("Check state of auth");
            const bool signedIn = false;

            if (signedIn == false) {
              machine.fire(AuthSTmE.evSignin);
            } else {
              machine.fire(AuthSTmE.evSignedin);
            }
            
          },
        ),
      ),
      AuthSTmS.signedOut: State(
        etm: {
          AuthSTmE.evSignedin: [AuthSTmT.toExJustSignedIn],
          AuthSTmE.evCancelSignin: [AuthSTmT.toSigninCancelled],
        },
        onEntry: Action(
          description: "AuthStatus.signedOut.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AuthStatus.signedOut.onEntry - ");
          },
        ),
        regions: [
          authStatusSignedOutRegion
        ],
      ),
      AuthSTmS.signedIn: State(
        etm: {
          AuthSTmE.evExit: [AuthSTmT.toExAlreadySignedIn], 
          AuthSTmE.evSignout: [AuthSTmT.toSignedOut],
        },
        onEntry: Action(
          description: "AuthStatus.signedIn.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AuthStatus.signedIn.onEntry - ");
           },
        ),
      ),
      AuthSTmS.signinCancelled: State(
        etm: {
          AuthSTmE.evSignin: [AuthSTmT.toSignedOut],
        },
        onEntry: Action(
          description: "AuthStatus.signinCancelled.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("AuthStatus.signinCancelled.onEntry - ");
          },
        ),
      ),
      AuthSTmS.exAlreadySignedIn: ExitPoint(),
      AuthSTmS.exJustSignedIn: ExitPoint(),
    },
    transitions: {
      AuthSTmT.toAuthStatus: Transition(to: AuthSTmS.authStatus),
      AuthSTmT.toSignedOut: Transition(to: AuthSTmS.signedOut),
      AuthSTmT.toSignedIn: Transition(to: AuthSTmS.signedIn),
      AuthSTmT.toSigninCancelled: Transition(to: AuthSTmS.signinCancelled),
      AuthSTmT.toExAlreadySignedIn: Transition(to: AuthSTmS.exAlreadySignedIn),
      AuthSTmT.toExJustSignedIn: Transition(to: AuthSTmS.exJustSignedIn),
    },
  );
  return authStatusMachine;
});
