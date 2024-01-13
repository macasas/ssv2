import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/regions/activity_status/layers/ui/controllers/inactive_screen_notifier.dart';


class InactiveScreen extends ConsumerWidget {
  const InactiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inactive Screen'),
      ),
      body: Column(
        children: [
          const Text('Inactive'),

          ElevatedButton(
            onPressed: () {
              ref.read(inactiveScreenNotifierProvider.notifier).activateButtonPressed(ref);
            }, 
            child: const Text('Activate'),
          ),

        ],
      ),
    );
  }
}
