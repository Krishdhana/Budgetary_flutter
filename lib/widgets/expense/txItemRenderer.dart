import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../shared/models/transaction_item.dart';

class ExpenseItemRenderer extends StatelessWidget {
  TransItem exp;
  int index;
  Function onClickItem;

  ExpenseItemRenderer(
      {required this.exp,
      required this.index,
      required this.onClickItem,
      super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var formatter =
        Provider.of<TxListProvider>(context, listen: false).numToCurrency;
    return Card(
      child: InkWell(
        onTap: () => {onClickItem(context, index)},
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: ListTile(
          // tileColor:
          //     exp.isIncome ? color.withOpacity(0.25) : color.withOpacity(0.1),
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            // exp.isIncome
            //     ? color.withAlpha(80)
            //     : exp.paymentMode == 'CREDIT_CARD'
            //         ? color.withAlpha(80)
            //         : color.withAlpha(80),
            child: Icon(
                exp.isIncome
                    ? Icons.trending_up
                    : exp.paymentMode == 'CREDIT_CARD'
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
            exp.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            exp.paymentMode != '' ? exp.paymentMode : 'INCOME',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatter(exp.amount),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: exp.isIncome ? Colors.green : Colors.red),
              ),
              Text(
                DateFormat('dd MMM').format(exp.date),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
