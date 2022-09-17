import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../shared/providers/txList_provider.dart';

class OverviewBanner extends StatelessWidget {
  OverviewBanner({super.key});

  double getPercentage({ctx, full = false}) {
    var txns =
        Provider.of<TxListProvider>(ctx, listen: false).getRecentTransactions;

    double percent =
        double.parse((txns.balance / txns.income).toStringAsFixed(2));
    if (percent > 0) {
      if (full) return percent * 100;
      return percent;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TxListProvider>(context);
    var transaction = provider.getRecentTransactions;
    Color color = Theme.of(context).primaryColor;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    const TextStyle textStyle = TextStyle(fontSize: 15);

    var summary = [
      {
        "field": 'Income',
        "value": provider.numToCurrency(transaction.income),
      },
      {
        "field": 'Expense',
        "value": provider.numToCurrency(transaction.spent),
      },
      {
        "field": 'CC Usage',
        "value": provider.numToCurrency(transaction.creditCardUsage),
      },
      {
        "field": 'Balance',
        "value": provider.numToCurrency(transaction.balance),
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: mediaQuery.size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircularPercentIndicator(
            radius: 70,
            lineWidth: 10,
            animation: true,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Balance',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${getPercentage(ctx: context, full: true)} %',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            backgroundColor: color.withAlpha(50),
            progressColor: color,
            animationDuration: 2,
            circularStrokeCap: CircularStrokeCap.round,
            percent: getPercentage(ctx: context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: summary
                .map(
                  (e) => Card(
                    child: Container(
                      width: mediaQuery.size.width * 0.38,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${e['field']}',
                            style: textStyle,
                          ),
                          Text('${e['value']}'),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Card(
      //           child: Container(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width * 0.4,
      //             // width: ,
      //             padding: const EdgeInsets.all(5),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 const Text(
      //                   'Income',
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //                 Text(
      //                   provider.numToCurrency(expense.income),
      //                   style: const TextStyle(fontSize: 18),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Card(
      //           child: Container(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width * 0.4,
      //             // width: ,
      //             padding: const EdgeInsets.all(5),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 const Text(
      //                   'Expensed',
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //                 Text(
      //                   provider.numToCurrency(expense.spent),
      //                   style: const TextStyle(fontSize: 18),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Card(
      //           // color: color.withOpacity(0.05),
      //           child: Container(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width * 0.4,
      //             // width: ,
      //             padding: const EdgeInsets.all(5),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 const Text(
      //                   'Balance',
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //                 Text(
      //                   provider.numToCurrency(expense.balance),
      //                   style: const TextStyle(fontSize: 18),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Card(
      //           // color: color.withOpacity(0.4),
      //           child: Container(
      //             height: 80,
      //             width: MediaQuery.of(context).size.width * 0.4,
      //             // width: ,
      //             padding: const EdgeInsets.all(5),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 const Text(
      //                   'Credit Usage',
      //                   style: TextStyle(fontSize: 16),
      //                 ),
      //                 Text(
      //                   provider.numToCurrency(expense.creditCardUsage),
      //                   style: const TextStyle(fontSize: 18),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     LinearPercentIndicator(
      //       lineHeight: 7,
      //       percent: 0.2,
      //     )
      //   ],
      // ),
    );
  }
}
