import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/controllers/confirm_account_screen_notifier.dart';

class ConfirmAccountScreen extends ConsumerWidget {
  const ConfirmAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Account Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(confirmAccountScreenNotifierProvider.notifier).successButtonPressed(ref);
            }, 
            child: const Text('Success'),
          ),

        ],
      ),
    );
  }
}
