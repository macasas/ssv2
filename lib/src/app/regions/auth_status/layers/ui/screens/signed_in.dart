import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';

class SignedInScreen extends ConsumerWidget {
  const SignedInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Column(
        children: [
          const Text('Signed In'),

          ElevatedButton(
            onPressed: () {
              ref.read(authStatusMachineProvider).fire(AuthSTmE.evSignout);
            }, 
            child: const Text('Sign Out'),
          ),

          ElevatedButton(
            onPressed: () {
              ref.read(authStatusMachineProvider).fire(AuthSTmE.evExit);
            }, 
            child: const Text('Already Signed In'),
          ),

        ],
      ),
    );
  }
}
