import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrov2/widget/headerTab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:registrov1/provider/clientProvider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final client = ref.watch(clientProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Headertab(title: "Profile"),
              CupertinoButton(
                child: Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // Prima metà
                              Expanded(
                                child: SizedBox(
                                  child: Center(
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/avatar.png',
                                        width: 100.0,
                                        height: 100,
                                        fit: BoxFit.cover, // riempie l’ovale
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Seconda metà
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "BENTORNATO",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: CupertinoColors.systemGrey2,
                                        ),
                                      ),
                                      Text(
                                        "Riccardo",
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w700,
                                          color: CupertinoColors.label,
                                          // .withOpacity(0.8),
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        "CLASSE",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: CupertinoColors.systemGrey2,
                                        ),
                                      ),
                                      Text(
                                        "4aiin",
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w700,
                                          color: CupertinoColors.label,
                                          // .withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: CupertinoColors.label.withOpacity(0.7),
                            thickness: 0.5,
                            height: 10.0,
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                // Prima metà
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "8",
                                                style: TextStyle(
                                                  fontSize: 59,
                                                  fontWeight: FontWeight.bold,
                                                  color: CupertinoColors.label,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 24.0,
                                                  left: 4.0,
                                                ),
                                                child: Text(
                                                  "/10",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color:
                                                        CupertinoColors.label,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 24.0,
                                              width: 24.0,
                                              decoration: BoxDecoration(
                                                color: CupertinoColors
                                                    .systemGreen
                                                    .withOpacity(0.2),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                CupertinoIcons.arrow_up,
                                                size: 12.0,
                                                color: CupertinoColors
                                                    .systemGreen
                                                    .darkColor,
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            Text(
                                              "8.21 %",
                                              style: TextStyle(
                                                color: CupertinoColors
                                                    .systemGreen
                                                    .darkColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                // Seconda metà
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Expanded(
                                      Align(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.systemRed
                                                .withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              12.0,
                                              10.0,
                                              12.0,
                                              10.0,
                                            ),
                                            child: Text(
                                              "4 Matematica",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: CupertinoColors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "View All",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    CupertinoColors.systemGrey,
                                              ),
                                            ),
                                            SizedBox(width: 4.0),

                                            Icon(
                                              CupertinoIcons.chevron_right_2,
                                              size: 14.0,
                                              color: CupertinoColors.systemGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
