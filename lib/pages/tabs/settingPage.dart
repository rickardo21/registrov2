import 'package:flutter/cupertino.dart';
import 'package:registrov2/utils/debugLogger.dart';

class SettingPage extends StatelessWidget {

    const SettingPage({super.key});

    @override
    Widget build(BuildContext context) {

        final logs = DebugLogger().logs.reversed.toList();

        return CupertinoPageScaffold(
        child: SafeArea(
            child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(8.0),
                    child: Text(logs[index], style: TextStyle(fontSize: 12.0),)
                ),
            )
        )
    );
    }
}