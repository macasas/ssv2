import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';


class  SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(signedOutMachineProvider).fire(SOUTmE.signin);
            }, 
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(signedOutMachineProvider).fire(SOUTmE.cancelSignin);
            }, 
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
