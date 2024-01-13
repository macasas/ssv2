import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';

// MACHINES
import 'package:ssv2/src/app/regions/activity_status/layers/base/activity_status_machine.dart';
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/base/active_machine.dart';

final activityStatusActiveRegionProvider = Provider((ref) {
  
  final activeMachine = ref.read(activeMachineProvider);
  
  return Region<ActSTmS, ActSTmE, ActSTmT, ACTmS>(
     machine: activeMachine,
  );

});