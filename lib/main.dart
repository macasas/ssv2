import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hisma/hisma.dart';
import 'package:hisma_console_monitor/hisma_console_monitor.dart';
import 'package:hisma_visual_monitor/hisma_visual_monitor.dart';

// ENTRY HISMA STATE
import 'package:ssv2/src/app/layers/base/app_machine.dart';
import 'package:ssv2/src/app/layers/base/app_router.dart';


Future<void> main() async {
  // initLogging();
  StateMachine.monitorCreators = [
    (m) => VisualMonitor(
      m,
      // host: 'localhost',
      port: 4040,
    ),
    (m) => ConsoleMonitor(m),
  ];

  runApp(const ProviderScope(child: MyApp()));
  
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  
  late Future<void> f;
  
  @override
  void initState() {
    super.initState();

    final appStateMachine = ref.read(appMachineProvider);
    f = appStateMachine.start();

    // final signedOutStateMachine = ref.read(signedOutMachineProvider);
    // f = signedOutStateMachine.start();

    //signedOutMachinePlay(signedOutStateMachine);
    
  }

  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: ref.read(appRouterProvider).routerDelegate,
      routeInformationParser: ref.read(appRouterProvider).routeInformationParser,
    );

    final futureBuilder = FutureBuilder<void>(
      future: f,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return materialApp;
          default:
            return const CircularProgressIndicator();
        }
      },
    );

    return futureBuilder;
  }
}

// void initLogging() {
//   // This shall be done 1st to allow Logger configuration for a hierarchy.
//   hierarchicalLoggingEnabled = true;

//   Logger.root.level = Level.OFF;
//   Logger(vismaMonitorName).level = Level.INFO;
//   Logger.root.onRecord.listen((record) {
//     // ignore: avoid_print
//     print(
//       '${record.level.name}: '
//       '${record.time}: '
//       '${record.loggerName}: '
//       '${record.message}',
//     );
//   });
// }
