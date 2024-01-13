import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ssv2/src/app/regions/activity_status/regions/active/layers/ui/controllers/active_screen_notifier.dart';


class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: Column(
        children: [
          const Text('Progress'),

          ElevatedButton(
            onPressed: () {
              ref.read(activeScreenNotifierProvider.notifier).progressButtonPressed(ref);
            }, 
            child: const Text('Progress'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(activeScreenNotifierProvider.notifier).profileButtonPressed(ref);
            }, 
            child: const Text('Profile'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(activeScreenNotifierProvider.notifier).settingsButtonPressed(ref);
            }, 
            child: const Text('Settings'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(activeScreenNotifierProvider.notifier).courseButtonPressed(ref);
            }, 
            child: const Text('Course'),
          ),
        ],
      ),
    );
  }
}
