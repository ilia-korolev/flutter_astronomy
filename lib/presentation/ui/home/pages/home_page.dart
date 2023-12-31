import 'package:flutter/material.dart';
import 'package:flutter_astronomy/app/_export.dart';
import 'package:flutter_astronomy/core/_export.dart';
import 'package:go_router/go_router.dart';

import '../views/_export.dart';
import '../widgets/_export.dart';

enum HomePageTab {
  dailyMedia,
  news,
  settings;

  String title(AppLocalizations l10n) {
    switch (this) {
      case HomePageTab.dailyMedia:
        return l10n.dailyMediaTitle;
      case HomePageTab.news:
        return l10n.newsTitle;
      case HomePageTab.settings:
        return l10n.settingsTitle;
    }
  }

  String get path {
    switch (this) {
      case HomePageTab.dailyMedia:
        return '/daily-media';
      case HomePageTab.news:
        return '/news';
      case HomePageTab.settings:
        return '/settings';
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    required this.tab,
    super.key,
  });

  final HomePageTab tab;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeBreakpoint = Breakpoint.getActive(context);

    switch (activeBreakpoint) {
      case Breakpoint.compact:
        return Scaffold(
          body: PageSwitcher(
            duration: theme.durations.medium,
            index: tab.index,
            children: const [
              DailyMediaView(),
              NewsView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: HomeNavigationBar(
            activeTab: HomePageTab.values[tab.index],
            onTabSelected: (tab) {
              context.go(tab.path);
            },
          ),
        );

      case Breakpoint.medium:
      case Breakpoint.expanded:
        return Scaffold(
          body: HomeNavigationRail(
            activeTab: tab,
            onTabSelected: (tab) {
              context.go(tab.path);
            },
            body: PageSwitcher(
              duration: theme.durations.medium,
              index: tab.index,
              children: const [
                DailyMediaView(),
                NewsView(),
                SettingsView(),
              ],
            ),
          ),
        );
    }
  }
}
