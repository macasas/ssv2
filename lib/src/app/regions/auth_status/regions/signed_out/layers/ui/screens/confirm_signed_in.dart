import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';


class ConfirmSignedInScreen extends ConsumerWidget {
  const ConfirmSignedInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Signed In Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(signedOutMachineProvider).fire(SOUTmE.success);
            }, 
            child: const Text('Continue'),
          ),

        ],
      ),
    );
  }
}
