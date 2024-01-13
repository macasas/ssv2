import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/account_status/regions/noaccount/layers/ui/controllers/deny_account_screen_notifier.dart';

class DenyAccountScreen extends ConsumerWidget {
  const DenyAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deny Account Screen'),
      ),
      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {
              ref.read(denyAccountScreenNotifierProvider.notifier).backButtonPressed(ref);
            }, 
            child: const Text('Back'),
          ),

        ],
      ),
    );
  }
}
