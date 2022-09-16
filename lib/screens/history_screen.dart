import 'package:Budgetary/shared/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/history/expansion_list.dart';
import '../shared/providers/txList_provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    List<Transaction> txns = context.read<TxListProvider>().getTxnsHistory();

    return Container(
      // padding: EdgeInsets.symmetric(
      //     vertical: MediaQuery.of(context).padding.top, horizontal: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              'History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ExpansionList(
              txnsList: txns,
            ),
          ),
        ],
      ),
    );
  }
}
