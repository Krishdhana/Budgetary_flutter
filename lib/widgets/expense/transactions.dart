import 'package:Budgetary/shared/models/selected_Transaction.dart';
import 'package:Budgetary/widgets/home/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/providers/txList_provider.dart';
import '../home/TxBottomSheet.dart';
import 'txItemRenderer.dart';

class Transactions extends StatefulWidget {
  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late selectedTransaction selectedTx;

  void onTxTap(ctx, idx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      context: ctx,
      builder: ((_) {
        selectedTx = selectedTransaction(
            txItem: context
                .read<TxListProvider>()
                .getRecentTransactions
                .txList[idx],
            index: idx);
        return TxBottomSheet(
          selectedTx: selectedTx,
        );
      }),
    ).then((val) {
      _initAction(ctx, val);
    });
  }

  void _initAction(ctx, opt) {
    switch (opt) {
      case 1:
        viewExpense(ctx);
        break;
      case 2:
        _updateExpDialog(ctx);
        break;
      case 3:
        context.read<TxListProvider>().deleteTransaction(selectedTx);
    }
  }

  void viewExpense(ctx) {
    showDialog(context: ctx, builder: (_) => ViewTransaction(selectedTx));
  }

  void _updateExpDialog(ctx) {
    Navigator.of(ctx).pushNamed('/addNewExpenseScreen',
        arguments: {"isEditMode": true, "selectedTx": selectedTx});
  }

  @override
  Widget build(BuildContext context) {
    final recentTxns =
        Provider.of<TxListProvider>(context).getRecentTransactions;
    return recentTxns.txList.isNotEmpty
        ? Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (bCtx, constraints) {
                      return ListView.builder(
                        // separatorBuilder: (context, index) => Divider(),
                        itemCount: recentTxns.txList.length,
                        itemBuilder: (context, idx) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ExpenseItemRenderer(
                            exp: recentTxns.txList[idx],
                            index: idx,
                            onClickItem: onTxTap,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        : const Center(
            child: Text('No Expenses'),
          );
  }
}
