import 'package:Budgetary/shared/models/selected_Transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/models/transaction_item.dart';

class TxBottomSheet extends StatelessWidget {
  selectedTransaction selectedTx;

  TxBottomSheet({required this.selectedTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withAlpha(40),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            selectedTx.txItem.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context, 1);
            },
            child: const ListTile(
              leading: Icon(Icons.details_sharp),
              title: Text('Details'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context, 2);
            },
            child: const ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context, 3);
            },
            child: const ListTile(
              leading: Icon(
                Icons.delete,
              ),
              title: Text('Delete'),
            ),
          ),
        ],
      ),
    );
  }
}
