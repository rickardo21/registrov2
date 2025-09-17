import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/api/models/LessonsModel.dart';
import 'package:registrov2/provider/clientProvider.dart';
import 'package:registrov2/widget/headerTab.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Todaypage extends ConsumerWidget {
  const Todaypage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<Map<String, dynamic>> agenda = [];

    Future<void> fetchLessons() async {
        final client = ref.watch(clientProvider);
        final lessons = await client.fetchLessons("20250917");
        
        agenda = lessons.map((lesson) => lesson.toJson()).toList();
    }

    fetchLessons();

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SafeArea(
        child: Column(
          children: [
            Headertab(title: "Today"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0, // posizione della linea
                    connectorTheme: const ConnectorThemeData(
                      thickness: 0.5,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),

                  builder: TimelineTileBuilder.connected(
                    itemCount: agenda.length,
                    connectorBuilder: (_, index, __) =>
                        const SolidLineConnector(),
                    indicatorBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "8:00",
                        style: TextStyle(
                          color: CupertinoColors.label.withOpacity(0.6),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    contentsBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20.0,
                          10.0,
                          20.0,
                          10.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemPurple.darkColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.systemPurple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  agenda[index]["subjectDesc"]
                                          .toString()[0]
                                          .toUpperCase() +
                                      agenda[index]["subjectDesc"]
                                          .toString()
                                          .substring(1)
                                          .toLowerCase(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.label,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
