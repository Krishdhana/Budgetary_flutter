import 'package:Budgetary/widgets/home/greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/expense/transactions.dart';
import '../widgets/home/overview_banner.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    print('home redrawn');
    return Scaffold(
      body: Column(
        children: [
          const Greeting('Krish'),
          OverviewBanner(),
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              // if (notification.direction == ScrollDirection.reverse) {
              //   if (isFabVisible) setState(() => isFabVisible = false);
              // } else if (notification.direction == ScrollDirection.forward) {
              //   if (!isFabVisible) setState(() => isFabVisible = true);
              // }
              if (notification.direction == ScrollDirection.idle) {
                if (!isFabVisible) setState(() => isFabVisible = true);
              } else {
                if (isFabVisible) setState(() => isFabVisible = false);
              }
              return true;
            },
            child: Transactions(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/addNewExpenseScreen');
              },
            )
          : null,
    );
  }
}
