import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registrov2/pages/tabs/profilePage.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge),
            label: 'Profilo',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.table),
            label: 'TimeTable',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Impostazioni',
          ),
        ],
        iconSize: 24.0,
        activeColor: CupertinoColors.label,
        inactiveColor: CupertinoColors.systemGrey,
      ),
      backgroundColor: CupertinoColors.systemBackground,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const ProfilePage();
          case 1:
            return const ProfilePage();
          case 2:
            return const ProfilePage();
          case 3:
            return const ProfilePage();
          case 4:
            return const ProfilePage();
          default:
            return const ProfilePage();
        }
      },
    );
  }
}
