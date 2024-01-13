import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'active_machine.dart';
// SCREENS
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/course_screen.dart';
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/profile_screen.dart';
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/progress_screen.dart';
import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/settings_screen.dart';
// import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/screens/active_screen.dart';




final activeRouterProvider = Provider((ref) => HismaRouterGenerator<ACTmS, Widget, ACTmE>(
    machine: ref.read(activeMachineProvider),
    creators: {
      ACTmS.progress: MaterialPageCreator<ACTmS>(widget: const ProgressScreen(),),
      ACTmS.profile: MaterialPageCreator<ACTmS>(widget: const ProfileScreen(),),
      ACTmS.settings: MaterialPageCreator<ACTmS>(widget: const SettingsScreen(),),
      ACTmS.course: MaterialPageCreator<ACTmS>(widget: const CourseScreen(),),
    },
  ),
);
