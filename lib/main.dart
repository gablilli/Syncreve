import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncreve/providers/account_provider.dart';
import 'package:syncreve/providers/app_provider.dart';
import 'package:syncreve/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mount the providers
    ref.watch(appProvider.select((_) => null));
    ref.watch(accountManagerProvider.select((_) => null));

    return MaterialApp(
      title: 'Syncreve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 241, 246),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color.fromARGB(255, 24, 24, 24),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
