import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewBanner extends StatelessWidget {
  OverviewBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TxListProvider>(context);
    var expense = provider.getRecentTransactions;
    // var color = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Income',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        provider.numToCurrency(expense.income),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Expensed',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        provider.numToCurrency(expense.spent),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                // color: color.withOpacity(0.05),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        provider.numToCurrency(expense.balance),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                // color: color.withOpacity(0.4),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.4,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Credit Usage',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        provider.numToCurrency(expense.creditCardUsage),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
