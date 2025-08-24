import 'package:flutter/cupertino.dart';
import 'package:registrov2/widget/headerTab.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Todaypage extends StatelessWidget {
  const Todaypage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          children: [
            Headertab(title: "Today"),
            Timeline(
              children: const [
                TimelineTile(
                  node: TimelineNode(
                    indicator: OutlinedDotIndicator(),
                    endConnector: SolidLineConnector(),
                  ),
                  contents: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Event 1'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
