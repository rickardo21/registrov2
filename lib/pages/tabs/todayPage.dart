import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/provider/clientProvider.dart';
import 'package:registrov2/widget/headerTab.dart';

class Todaypage extends ConsumerWidget {
  const Todaypage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, dynamic>> agenda = [];

    var loading = true;

    Future<void> fetchLessons() async {
      final client = ref.watch(clientProvider);
      final lessons = await client.fetchLessons("20250917");

      agenda = lessons.map((lesson) => lesson.toJson()).toList();

      loading = false;
    }

    fetchLessons();

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SafeArea(
        child: loading == true
            ? const Center(child: CupertinoActivityIndicator())
            : Column(
                children: [
                  Headertab(title: "Today"),
                  Expanded(
                    child: ListView(
                      children: agenda
                          .map(
                            (physics) =>
                                Text(physics["subjectDesc"].toString()),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
