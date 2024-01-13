import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/controllers/register_screen_notifier.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(registerScreenNotifierProvider.notifier).registerButtonPressed(ref);
            }, 
            child: const Text('Register'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(registerScreenNotifierProvider.notifier).cancelButtonPressed(ref);
            }, 
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
