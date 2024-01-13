import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/auth_status/regions/signed_out/layers/base/signed_out_machine.dart';

class ForgotScreen extends ConsumerWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(signedOutMachineProvider).fire(SOUTmE.cancelReset);
            }, 
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(signedOutMachineProvider).fire(SOUTmE.reset);
            }, 
            child: const Text('Reset'),
          ),

        ],
      ),
    );
  }
}
