import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'activity_status_machine.dart';
// REGIONS
// active region goes here
// SCREENS
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/active_screen.dart';
import 'package:ssv2/src/app/regions/activity_status/layers/ui/screens/inactive_screen.dart';


final activityStatusRouterProvider = Provider((ref) => HismaRouterGenerator<ActSTmS, Widget, ActSTmE>(
    machine: ref.read(activityStatusMachineProvider),
    creators: {
      ActSTmS.activityStatus: NoUIChange(),
      ActSTmS.active: MaterialPageCreator<ActSTmS>(
        widget: const ActiveScreen(),),
      ActSTmS.inactive: MaterialPageCreator<ActSTmS>(widget: const InactiveScreen(),),

    },
  ),
);
