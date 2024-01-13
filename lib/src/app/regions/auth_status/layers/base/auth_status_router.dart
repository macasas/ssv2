import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'auth_status_machine.dart';
// REGIONS
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_router.dart';
// SCREENS
import 'package:ssv2/src/app/regions/auth_status/layers/ui/screens/signed_in.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/ui/screens/signin_cancelled.dart';


final authStatusRouterProvider = Provider((ref) => HismaRouterGenerator<AuthSTmS, Widget, AuthSTmE>(
    machine: ref.read(authStatusMachineProvider),
    creators: {
      AuthSTmS.authStatus: NoUIChange(),
      AuthSTmS.signedIn: MaterialPageCreator<AuthSTmS>(widget: const SignedInScreen(),),
      AuthSTmS.signinCancelled: MaterialPageCreator<AuthSTmS>(widget: const SigninCancelledScreen(),),
      AuthSTmS.signedOut: MaterialPageCreator<AuthSTmS>(
        widget: Router(
          routerDelegate: 
            ref.read(signedOutRouterProvider).routerDelegate
        ),
      )
    },
  ),
);
