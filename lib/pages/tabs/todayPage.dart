import 'package:flutter/cupertino.dart';
import 'package:registrov2/widget/headerTab.dart';
import 'package:timelines_plus/timelines_plus.dart';

class Todaypage extends StatelessWidget {
  const Todaypage({super.key});

  static const agenda = [
    {
      "ore": "8:00",
      "title": "Matematica",
      "description": "Lezione di matematica con il prof. Rossi",
    },
    {
      "ore": "9:00",
      "title": "Italiano",
      "description": "Lezione di italiano con la prof.ssa Verdi",
    },
    {
      "ore": "10:00",
      "title": "Informatica",
      "description": "Lezione di informatica con la prof.ssa Bianchi",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                        agenda[index]['ore']!,
                        style: const TextStyle(
                          color: CupertinoColors.label,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    contentsBuilder: (_, index) {
                      final events = agenda;
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
                            color: CupertinoColors.systemBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              events[index]['title']!,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
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
