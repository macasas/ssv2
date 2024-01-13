import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/account_status/layers/ui/controllers/account_status_screen_notifier.dart';

class AccountStatusScreen extends ConsumerWidget {
  const AccountStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Status Screen'),
      ),
      body: Column(
        children: [
          const Text('Account Status'),
          const Text('Existing account found'),

          ElevatedButton(
            onPressed: () {
              ref.read(accountStatusScreenNotifierProvider.notifier).continuedButtonPressed(ref);
            },
            child: const Text('Continue'),
          ),

        ],
      ),
    );
  }
}
