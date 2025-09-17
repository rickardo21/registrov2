import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/pages/HomePage.dart';
import 'package:registrov2/pages/auth/introPage.dart';
import 'package:registrov2/pages/splashPage.dart';
import 'package:registrov2/provider/clientProvider.dart';

void main() {
    // runApp(DevicePreview(builder: (context) => ProviderScope(child: MyApp())));
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final apiClient = ref.read(clientProvider);
    await apiClient.login("S9477262T", "Rickardo@07");
    // final user = await apiClient.loadUser();

    // if (user != null) {
    // apiClient.user = user;
    // }

    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const CupertinoApp(home: SplashPage());
    }

    final user = ref.read(clientProvider).user;

    return CupertinoApp(
      color: CupertinoColors.secondarySystemBackground,
      debugShowCheckedModeBanner: false,
      home: user.token != null ? const HomePage() : const IntroPage(),
    );
  }
}
