import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/auth_status/layers/base/auth_status_machine.dart';

class SigninCancelledScreen extends ConsumerWidget {
  const SigninCancelledScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin Cancelled Screen'),
      ),
      body: Column(
        children: [
          const Text('Signin Cancelled'),

          ElevatedButton(
            onPressed: () {
              ref.read(authStatusMachineProvider).fire(AuthSTmE.evSignin);
            }, 
            child: const Text('Retry Sign In'),
          ),

        ],
      ),
    );
  }
}
