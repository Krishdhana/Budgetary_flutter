import 'package:Budgetary/widgets/home/greeting.dart';
import 'package:flutter/material.dart';

import '../widgets/expense/transactions.dart';
import '../widgets/home/overview_banner.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('home redrawn');
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          const Greeting('Krish'),
          OverviewBanner(),
          Transactions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addNewExpenseScreen');
        },
      ),
    );
  }
}
