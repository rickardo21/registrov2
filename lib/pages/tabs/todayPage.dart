import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/api/models/LessonsModel.dart';
import 'package:registrov2/provider/clientProvider.dart';
import 'package:registrov2/widget/headerTab.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  Future<List<LessonModel>> fetchLessons(WidgetRef ref) async {
    final client = ref.watch(clientProvider);
    return await client.fetchLessons("20250917"); 
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SafeArea(
        child: FutureBuilder<List<LessonModel>>(
          future: fetchLessons(ref),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Errore: ${snapshot.error}'));
            } else {
              final lessons = snapshot.data ?? [];
              return Column(
                children: [
                  const Headertab(title: "Today"),
                  Expanded(
                    child: ListView(
                      children: lessons
                          .map((lesson) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(lesson.subjectDesc),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
