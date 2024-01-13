import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/controllers/active_screen_notifier.dart';


class ActiveScreen extends ConsumerWidget {
  const ActiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Screen'),
      ),
      body: Column(
        children: [
          const Text('Active'),
          const Text('Temporary Screen, replace with Active region'),

          ElevatedButton(
            onPressed: () {
              ref.read(activeScreenNotifierProvider.notifier).settingsButtonPressed(ref);
            }, 
            child: const Text('Settings'),
          ),

        ],
      ),
    );
  }
}
