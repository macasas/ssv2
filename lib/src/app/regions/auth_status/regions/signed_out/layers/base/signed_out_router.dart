import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma_flutter/hisma_flutter.dart';

// MACHINE
import 'signed_out_machine.dart';
// SCREENS
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/ui/screens/signin.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/ui/screens/confirm_signed_in.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/ui/screens/forgot.dart';



final signedOutRouterProvider = Provider((ref) => HismaRouterGenerator<SOUTmS, Widget, SOUTmE>(
    machine: ref.read(signedOutMachineProvider),
    creators: {
      SOUTmS.signin: MaterialPageCreator<SOUTmS>(widget: const SigninScreen(),),
      SOUTmS.confirmSignin: MaterialPageCreator<SOUTmS>(widget: const ConfirmSignedInScreen(),),
      SOUTmS.forgot: MaterialPageCreator<SOUTmS>(widget: const ForgotScreen(),)
    },
  ),
);
