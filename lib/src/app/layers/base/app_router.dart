import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'app_machine.dart';
// REGIONAL ROUTERS
import 'package:ssv2/src/app/regions/account_status/layers/base/account_status_router.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_router.dart';
import 'package:ssv2/src/app/regions/activity_status/layers/base/activity_status_router.dart';
// SCREENS
import 'package:ssv2/src/app/layers/ui/screens/init_screen.dart';
// ... expecting something here if screens

final appRouterProvider = Provider(
    (ref) => HismaRouterGenerator<AmS, Widget, AmE>(
        machine: ref.read(appMachineProvider),
        creators: {
          AmS.init: MaterialPageCreator<AmS>(widget: const InitScreen(),),
          // AmS.accountStatus: MaterialPageCreator<AmS>(widget: const InitScreen(),),
          // AmS.authStatus: MaterialPageCreator<AmS>(widget: const InitScreen(),),
          // AmS.activityStatus: MaterialPageCreator<AmS>(widget: const InitScreen(),),

          AmS.accountStatus: MaterialPageCreator<AmS>(
              widget: Router(
                routerDelegate: 
                  ref.read(accountStatusRouterProvider).routerDelegate
              ),
          ),
          AmS.authStatus: MaterialPageCreator<AmS>(
              widget: Router(
                routerDelegate: 
                  ref.read(authStatusRouterProvider).routerDelegate
              ),
          ),
          AmS.activityStatus: MaterialPageCreator<AmS>(
              widget: Router(
                routerDelegate: 
                  ref.read(activityStatusRouterProvider).routerDelegate
              ),
          ),
        },
    ),
);