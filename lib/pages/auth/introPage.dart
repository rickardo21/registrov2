import 'package:flutter/cupertino.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Benvenuto")),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text("Inizia"),
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   CupertinoPageRoute(builder: (_) => const LoginPage()),
            // );
          },
        ),
      ),
    );
  }
}
