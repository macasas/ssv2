// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_flutter/hisma_flutter.dart';


enum ACTmS { 
  progress,
  profile,
  settings,
  course
}

enum ACTmE { 
  showProgress,
  showProfile,
  showSettings,
  showCourse
}
// failed not used, need some hidden state that signs in
// and comes back with the state.

enum ACTmT { 
  toProgress,
  toProfile,
  toSettings,
  toCourse
}


final activeMachineProvider = Provider((ref) {
  
  final activeMachine = StateMachineWithChangeNotifier<ACTmS, ACTmE, ACTmT>(
    events: ACTmE.values,
    name: 'active',
    initialStateId: ACTmS.progress,
    states: {
      ACTmS.progress: State(
        etm: {
          ACTmE.showProgress: [ACTmT.toProgress],
          ACTmE.showProfile: [ACTmT.toProfile],
          ACTmE.showSettings: [ACTmT.toSettings],
          ACTmE.showCourse: [ACTmT.toCourse],
        },
      ),
      ACTmS.profile: State(
        etm: {
          ACTmE.showProgress: [ACTmT.toProgress],
          ACTmE.showProfile: [ACTmT.toProfile],
          ACTmE.showSettings: [ACTmT.toSettings],
          ACTmE.showCourse: [ACTmT.toCourse],
        },
      ),
      ACTmS.settings: State(
        etm: {
          ACTmE.showProgress: [ACTmT.toProgress],
          ACTmE.showProfile: [ACTmT.toProfile],
          ACTmE.showSettings: [ACTmT.toSettings],
          ACTmE.showCourse: [ACTmT.toCourse],
        },
      ),
      ACTmS.course: State(
        etm: {
          ACTmE.showProgress: [ACTmT.toProgress],
          ACTmE.showProfile: [ACTmT.toProfile],
          ACTmE.showSettings: [ACTmT.toSettings],
          ACTmE.showCourse: [ACTmT.toCourse],
        },
      ),
    },
    transitions: {
      ACTmT.toProgress: Transition(to: ACTmS.progress),
      ACTmT.toProfile: Transition(to: ACTmS.profile),
      ACTmT.toSettings: Transition(to: ACTmS.settings),
      ACTmT.toCourse: Transition(to: ACTmS.course),
    },
  );
  return activeMachine;
});
