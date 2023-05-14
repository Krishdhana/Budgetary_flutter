import 'package:Budgetary/shared/providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'shared/providers/txList_provider.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/home_screen.dart';
import 'shared/widgets/BottomNavBar.dart';
import 'screens/add_transaction_screen.dart';

void main() {
  runApp(const Budgetary());
}

class Budgetary extends StatefulWidget {
  const Budgetary({super.key});

  @override
  State<StatefulWidget> createState() {
    return BudgetaryState();
  }
}

class BudgetaryState extends State<Budgetary> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const SettingsScreen(),
  ];

  int _activeRouteIndex = 0;

  void _changeRoute(int idx) {
    setState(() {
      _activeRouteIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      late Color appColorSeed;

      if (lightDynamic != null) {
        appColorSeed = lightDynamic.primary;
      } else {
        appColorSeed = Colors.deepPurple.shade600;
      }

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TxListProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AppSettingsProvider(),
          )
        ],
        builder: ((context, child) => MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
                colorSchemeSeed:
                    context.watch<AppSettingsProvider>().useColorFromWallpaper
                        ? appColorSeed
                        : context.watch<AppSettingsProvider>().appColor,
                // brightness: Brightness.dark
                // brightness: Brightness.dark,
              ),
              home: Scaffold(
                body: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SafeArea(
                    child: _pages[_activeRouteIndex],
                  ),
                ),
                bottomNavigationBar:
                    BottomNavBar(_activeRouteIndex, _changeRoute),
              ),
              onGenerateRoute: (RouteSettings routeSettings) {
                switch (routeSettings.name) {
                  case "/addNewExpenseScreen":
                    var args = routeSettings.arguments;
                    return MaterialPageRoute(
                      builder: (context) {
                        if (args != null) {
                          var data =
                              routeSettings.arguments as Map<String, dynamic>;
                          return AddTransactionScreen(
                            isEditMode: data['isEditMode'],
                            selectedTx: data['selectedTx'],
                          );
                        }
                        return AddTransactionScreen();
                      },
                    );
                }
                return null;
              },
            )),
      );
    });
  }
}
