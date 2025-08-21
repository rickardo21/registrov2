import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/pages/HomePage.dart';
import 'package:registrov2/pages/auth/introPage.dart';
import 'package:registrov2/provider/clientProvider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {

    final client = ref.read(clientProvider);
    await Future.delayed(const Duration(seconds: 2));

    final user = await client.loadUser();
    if (user != null && user.token != null) {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const HomePage()));
    } else {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const IntroPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: CupertinoActivityIndicator(radius: 20),
      ),
    );
  }
}
