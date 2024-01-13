import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'account_status_machine.dart';
// import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/base/no_account_router.dart';
// SCREENS
import 'package:ssv2/src/app/regions/account_status/layers/ui/screens/account_status_screen.dart';


final accountStatusRouterProvider = Provider((ref) => HismaRouterGenerator<AccSTmS, Widget, AccSTmE>(
    machine: ref.read(accountStatusMachineProvider),
    creators: {
      AccSTmS.accountStatus: NoUIChange(),
      AccSTmS.account: MaterialPageCreator<AccSTmS>(
        widget: const AccountStatusScreen(),),
      AccSTmS.noAccount: NoUIChange(), //MaterialPageCreator<AccSTmS>(
      //   widget: Router(
      //     routerDelegate: 
      //       ref.read(noAccountRouterProvider).routerDelegate
      //   ),
      // )
    },
  ),
);
