import 'package:Budgetary/shared/models/selected_Transaction.dart';
import 'package:Budgetary/widgets/home/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/providers/txList_provider.dart';
import 'txItemRenderer.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late selectedTransaction selectedTx;

  void onTxItemTap(idx, action) {
    selectedTx = selectedTransaction(
      txItem: context.read<TxListProvider>().getRecentTransactions.txList[idx],
      index: idx,
    );

    _performAction(action);
  }

  void _performAction(opt) {
    switch (opt) {
      case 'DETAILS':
        _viewTx();
        break;
      case 'EDIT':
        _editTx();
        break;
      case 'DELETE':
        _deleteTx();
        break;
    }
  }

  void _viewTx() {
    showDialog(context: context, builder: (_) => ViewTransaction(selectedTx));
  }

  void _editTx() {
    Navigator.of(context).pushNamed('/addNewExpenseScreen',
        arguments: {"isEditMode": true, "selectedTx": selectedTx});
  }

  void _deleteTx() {
    showDialog(
        context: context,
        builder: ((ctx) => AlertDialog(
              title: Row(
                children: [
                  const Text('Delete'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedTx.txItem.name,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              content:
                  const Text('Are you sure want to delete this Transaction ?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<TxListProvider>()
                          .deleteTransaction(selectedTx);
                      Navigator.pop(ctx);
                    },
                    child: const Text('Delete')),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final recentTxns =
        Provider.of<TxListProvider>(context).getRecentTransactions;
    return Expanded(
      child: recentTxns.txList.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 20),
                  child: const Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (bCtx, constraints) {
                      return ListView.builder(
                        clipBehavior: Clip.antiAlias,
                        // separatorBuilder: (context, index) => Divider(),
                        itemCount: recentTxns.txList.length > 10
                            ? 10
                            : recentTxns.txList.length,
                        itemBuilder: (context, idx) => ExpenseItemRenderer(
                          txItem: recentTxns.txList[idx],
                          onClickItem: (String action) =>
                              onTxItemTap(idx, action),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          : const Center(
              child: Text('No Expenses', style: TextStyle(fontSize: 18)),
            ),
    );
  }
}
