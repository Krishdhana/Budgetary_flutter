import 'package:Budgetary/shared/models/transaction.dart';
import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpansionList extends StatelessWidget {
  List<Transaction> txnsList;

  ExpansionList({super.key, required this.txnsList});

  @override
  Widget build(BuildContext context) {
    List<bool> isPanelOpen = [];

    for (var element in txnsList) {
      isPanelOpen.add(false);
    }

    var formatter = context.read<TxListProvider>().numToCurrency;
    var color = Theme.of(context).primaryColor;
    return ListView.builder(
      itemCount: txnsList.length,
      itemBuilder: (context, index) => Card(
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(horizontal: 10),
          // backgroundColor: color.withAlpha(80),
          title: Text(
            DateFormat('MMMM').format(txnsList[index].period),
          ),
          children: [
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.trending_up,
                  size: 25,
                  color: color,
                ),
              ),
              title: const Text('Total Transactions'),
              trailing: Text(
                '${txnsList[index].txList.length}',
                style: TextStyle(color: color, fontSize: 16),
              ),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.trending_up,
                  size: 25,
                  color: color,
                ),
              ),
              title: const Text('Income'),
              trailing: Text(
                formatter(txnsList[index].income),
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.trending_down,
                  size: 25,
                  color: color,
                ),
              ),
              title: const Text('Spent'),
              trailing: Text(
                formatter(txnsList[index].spent),
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.credit_card,
                  size: 25,
                  color: color,
                ),
              ),
              title: const Text('Credit Card Usage'),
              trailing: Text(
                formatter(txnsList[index].creditCardUsage),
                style: TextStyle(color: color, fontSize: 16),
              ),
            ),
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.currency_rupee,
                  size: 20,
                  color: color,
                ),
              ),
              title: const Text('Closing Balance'),
              trailing: Text(
                formatter(txnsList[index].balance),
                style: TextStyle(color: color, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
