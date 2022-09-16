import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../shared/models/transaction_item.dart';

class ExpenseItemRenderer extends StatelessWidget {
  TransItem txItem;
  Function onClickItem;

  ExpenseItemRenderer(
      {required this.txItem, required this.onClickItem, super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var formatter =
        Provider.of<TxListProvider>(context, listen: false).numToCurrency;
    return Slidable(
      key: ValueKey(txItem.id),
      closeOnScroll: true,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {
              onClickItem('DETAILS');
            },
            foregroundColor: color,
            icon: Icons.info_outline,
            // label: 'Edit',
          ),
          SlidableAction(
            onPressed: (ctx) {
              onClickItem('EDIT');
            },
            foregroundColor: color,
            icon: Icons.edit,
            // label: 'Edit',
          ),
          SlidableAction(
            onPressed: (ctx) {
              onClickItem('DELETE');
            },
            foregroundColor: color,
            icon: Icons.delete,
            // label: 'Delete',
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 0,
        child: ListTile(
          // onTap: () => (),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: txItem.isIncome
              ? color.withOpacity(0.22)
              : color.withOpacity(0.12),
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            // exp.isIncome
            //     ? color.withAlpha(80)
            //     : exp.paymentMode == 'CREDIT_CARD'
            //         ? color.withAlpha(80)
            //         : color.withAlpha(80),
            child: Icon(
                txItem.isIncome
                    ? Icons.trending_up
                    : txItem.paymentMode == 'CREDIT_CARD'
                        ? Icons.credit_card
                        : Icons.trending_down,
                size: 25,
                color: color
                // exp.isIncome
                //     ? color
                //     : exp.paymentMode == 'CREDIT_CARD'
                //         ? color
                //         : color,
                ),
          ),
          title: Text(
            txItem.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            txItem.paymentMode,
            style: const TextStyle(fontSize: 13),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatter(txItem.amount),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: txItem.isIncome ? Colors.green : Colors.red),
              ),
              Text(
                DateFormat('dd MMM').format(txItem.date),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
