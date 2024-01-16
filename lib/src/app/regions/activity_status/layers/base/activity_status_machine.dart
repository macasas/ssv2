// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';


enum ActSTmS { 
  epSignedIn,
  activityStatus,
  active,
  inactive
}

enum ActSTmE { 
  evCheckActivityStatus,
  evActivate,
  evDeactivate,
}

enum ActSTmT { 
  toActivityStatus,
  toActive,
  toInactive
}


final activityStatusMachineProvider = Provider((ref) {
  
  final activityStatusMachine = StateMachineWithChangeNotifier<ActSTmS, ActSTmE, ActSTmT>(
    events: ActSTmE.values,
    name: 'activityStatus',
    initialStateId: ActSTmS.active,
    states: {
      ActSTmS.epSignedIn: EntryPoint([ActSTmT.toActive]),
      ActSTmS.activityStatus: State(
        etm: {
          ActSTmE.evActivate: [ActSTmT.toActive],
          ActSTmE.evDeactivate: [ActSTmT.toInactive],
        },
        onEntry: Action(
          description: 'check for existence of activity',
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("ActivityStatus.activityStatus.onEntry");
            print("Check existence of activity");

            // CHANGE this to simulate inactivity
            const bool activity = true;

            if (activity == false) {
              machine.fire(ActSTmE.evDeactivate);
            } else {
              machine.fire(ActSTmE.evActivate);
            }
            
          },
        ),
      ),
      ActSTmS.active: State(
        etm: {
          ActSTmE.evDeactivate: [ActSTmT.toInactive],
        },
        onEntry: Action(
          description: "ActivityStatus.active.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("ActivityStatus.active.onEntry - ");
          },
        ),
        // regions: [
        //   registerRegion
        // ],
      ),
      ActSTmS.inactive: State(
        etm: {
          ActSTmE.evActivate: [ActSTmT.toActive], 
        },
        onEntry: Action(
          description: "ActivityStatus.active.onEntry", 
          action: (StateMachine<dynamic, dynamic, dynamic> machine, arg) {  
            print("ActivityStatus.active.onEntry - ");
           },
        ),
      ),
    },
    transitions: {
      ActSTmT.toActivityStatus: Transition(to: ActSTmS.activityStatus),
      ActSTmT.toActive: Transition(to: ActSTmS.active),
      ActSTmT.toInactive: Transition(to: ActSTmS.inactive),
    },
  );
  return activityStatusMachine;
});
