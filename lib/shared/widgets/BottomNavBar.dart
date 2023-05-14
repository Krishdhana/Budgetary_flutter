import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int _activePage;
  final Function _onChangePage;

  const BottomNavBar(this._activePage, this._onChangePage, {super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(color: Theme.of(context).primaryColor, fontSize: 13),
        ),
      ),
      child: NavigationBar(
        // backgroundColor: primaryColor.withAlpha(40),
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _activePage,
        height: 65,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int idx) => _onChangePage(idx),
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home_outlined, color: primaryColor),
              selectedIcon: Icon(Icons.home, color: primaryColor),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.history_edu, color: primaryColor),
              selectedIcon: Icon(Icons.history_edu, color: primaryColor),
              label: "History"),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined, color: primaryColor),
              selectedIcon: Icon(Icons.account_circle, color: primaryColor),
              label: "Profile"),
        ],
      ),
    );
  }
}
