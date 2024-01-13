import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ssv2/src/app/layers/ui/controllers/init_screen_notifier.dart';

class InitScreen extends ConsumerWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App starting Screen'),
      ),
      body: Column(
        children: [
          const Text('App Starting Screen'),
          ElevatedButton(
            onPressed: () {
              // starting position, 
              // unable to call region as first state
              // call the first region, accountStatus
              ref.read(initScreenNotifierProvider.notifier).startButtonPressed(ref);
            }, 
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
