import 'package:flutter/cupertino.dart';

class Headertab extends StatelessWidget {
  final String title;

  const Headertab({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            leadingDistribution: TextLeadingDistribution.even,
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ),
    );
  }
}
