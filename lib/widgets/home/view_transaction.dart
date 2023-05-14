import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../shared/models/selected_Transaction.dart';

class ViewTransaction extends StatelessWidget {
  selectedTransaction selectedExpense;
  ViewTransaction(this.selectedExpense, {super.key});

  @override
  Widget build(BuildContext context) {
    var amountFormatter =
        Provider.of<TxListProvider>(context, listen: false).numToCurrency;

    return AlertDialog(
      title: const Text('Expense Details'),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Id',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  selectedExpense.txItem.id.toString(),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  selectedExpense.txItem.name,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  DateFormat('dd MMMM').format(selectedExpense.txItem.date),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Amount',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  amountFormatter(selectedExpense.txItem.amount),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Mode',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  selectedExpense.txItem.paymentMode,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('OK'))
      ],
    );
  }
}
