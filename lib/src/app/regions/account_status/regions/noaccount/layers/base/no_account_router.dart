import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'no_account_machine.dart';
// SCREENS
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/screens/register_screen.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/screens/confirm_account_screen.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/screens/deny_account_screen.dart';


final noAccountRouterProvider = Provider((ref) => HismaRouterGenerator<NoACCmS, Widget, NoACCmE>(
    machine: ref.read(noAccountMachineProvider),
    creators: {
      NoACCmS.register: MaterialPageCreator<NoACCmS>(widget: const RegisterScreen(),),
      NoACCmS.confirmAccount: MaterialPageCreator<NoACCmS>(widget: const ConfirmAccountScreen(),),
      NoACCmS.denyAccount: MaterialPageCreator<NoACCmS>(widget: const DenyAccountScreen(),)
    },
  ),
);
