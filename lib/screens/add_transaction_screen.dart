import 'package:Budgetary/shared/models/selected_Transaction.dart';
import 'package:Budgetary/shared/models/transaction.dart';
import 'package:Budgetary/shared/providers/txList_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../shared/models/transaction_item.dart';

class AddTransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTransactionScreenState();
  bool isEditMode;
  var selectedTx;

  AddTransactionScreen({this.isEditMode = false, this.selectedTx = const {}});
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  String _paymentMode = 'CASH';
  bool _isIncome = false;

  @override
  void initState() {
    if (widget.isEditMode) {
      _nameController.text = widget.selectedTx.txItem.name;
      _amountController.text = '${widget.selectedTx.txItem.amount}';
      _paymentMode = widget.selectedTx.txItem.paymentMode;
      _isIncome = widget.selectedTx.txItem.isIncome;
    }
    super.initState();
  }

  void _onClick(ctx) {
    var provider = Provider.of<TxListProvider>(ctx, listen: false);

    var exp = TransItem(
      name: _nameController.text,
      amount: int.parse(_amountController.text),
      date: DateTime.now(),
      isIncome: _isIncome,
      paymentMode: _isIncome ? 'Income' : _paymentMode,
    );

    if (widget.isEditMode) {
      // widget.selectedTx.txItem = TransItem();
      var tx = TransItem(
          name: 'name',
          amount: 10,
          isIncome: true,
          date: DateTime.now(),
          paymentMode: "paymentMode");
      provider.updateTransaction(widget.selectedTx);
    } else {
      provider.onAddTransaction(exp);
    }
    Navigator.pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isEditMode
                      ? 'Update Transaction'
                      : 'Update Transaction',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    'Transaction Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChoiceChip(
                      label: const Text("Income"),
                      selected: _isIncome,
                      onSelected: (bool val) {
                        setState(() {
                          _isIncome = true;
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text("Expense"),
                      selected: !_isIncome,
                      onSelected: (bool val) {
                        setState(
                          () {
                            _isIncome = false;
                          },
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: _nameController,
                        maxLength: 10,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.badge_outlined),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          label: const Text(
                            'Name',
                          ),
                          filled: true,
                          fillColor: color.withAlpha(30),
                        ),
                      ),
                      TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.currency_rupee),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          label: const Text(
                            'Amount',
                          ),
                          filled: true,
                          fillColor: color.withAlpha(30),
                        ),
                      ),
                    ],
                  ),
                ),
                !_isIncome
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Payment Mode"),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ChoiceChip(
                                  label: const Text("Cash"),
                                  selected: _paymentMode == 'CASH',
                                  onSelected: (bool val) {
                                    setState(() {
                                      _paymentMode = 'CASH';
                                    });
                                  },
                                ),
                                ChoiceChip(
                                  label: const Text("Credit Card"),
                                  selected: _paymentMode == 'CREDIT_CARD',
                                  onSelected: (bool val) {
                                    setState(() {
                                      _paymentMode = 'CREDIT_CARD';
                                    });
                                  },
                                ),
                                ChoiceChip(
                                  label: const Text("Bank"),
                                  selected: _paymentMode == 'BANK',
                                  onSelected: (bool val) {
                                    setState(() {
                                      _paymentMode = 'BANK';
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _onClick(context);
                        },
                        child: Text(
                            widget.isEditMode ? "Update" : "Add Transaction"),
                      ),
                      TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: const Text('Cancel'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}