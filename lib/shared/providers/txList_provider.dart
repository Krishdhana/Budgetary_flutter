import 'dart:convert';

import 'package:Budgetary/shared/models/transaction_item.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/selected_Transaction.dart';
import '../models/transaction.dart';

class TxListProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];
  final _currency = NumberFormat.currency(
      name: 'INR', symbol: '₹', locale: 'en-IN', decimalDigits: 0);

  final String _storageKey = 'txList';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TxListProvider() {
    _loadDataFromStorage();
  }

  Transaction get getRecentTransactions {
    if (_transactions.isNotEmpty)
      return Transaction.clone(obj: _transactions[0]);
    else
      return Transaction(period: DateTime.now(), txList: []);
  }

  void addTransaction(TransItem tx) {
    tx.id = tx.id > 0 ? tx.id : _idGenerator();
    var currentTime = tx.date;

    if (_transactions.isEmpty ||
        DateFormat('MMMM').format(_transactions[0].period) !=
            DateFormat('MMMM').format(currentTime)) {
      var exp = Transaction(
        txList: [],
        period: DateTime.now(),
      );
      _transactions.insert(0, exp);
    }

    _transactions[0].txList.insert(0, tx);
    if (tx.isIncome) {
      _transactions[0].balance += tx.amount;
      _transactions[0].income += tx.amount;
    } else {
      if (tx.paymentMode == 'CREDIT_CARD') {
        _transactions[0].creditCardUsage += tx.amount;
      } else {
        _transactions[0].balance -= tx.amount;
        _transactions[0].spent += tx.amount;
      }
    }
    _updateState();
  }

  void updateTransaction(selectedTransaction selectedTx) {
    TransItem oldItem =
        _transactions[selectedTx.mainIdx].txList.removeAt(selectedTx.index);
    TransItem tx = selectedTx.txItem;
    tx.id = oldItem.id;

    if (tx.isIncome) {
      _transactions[selectedTx.mainIdx].balance -= oldItem.amount;
      _transactions[selectedTx.mainIdx].income -= oldItem.amount;

      _transactions[selectedTx.mainIdx].balance += tx.amount;
      _transactions[selectedTx.mainIdx].income += tx.amount;
    } else {
      if (tx.paymentMode == 'CREDIT_CARD') {
        _transactions[selectedTx.mainIdx].creditCardUsage += tx.amount;
        _transactions[selectedTx.mainIdx].creditCardUsage -= oldItem.amount;
      } else {
        _transactions[selectedTx.mainIdx].balance -= tx.amount;
        _transactions[selectedTx.mainIdx].spent += tx.amount;

        _transactions[selectedTx.mainIdx].balance += oldItem.amount;
        _transactions[selectedTx.mainIdx].spent -= oldItem.amount;
      }
    }

    _transactions[selectedTx.mainIdx].txList.insert(selectedTx.index, tx);
    print(_transactions[selectedTx.mainIdx]);
    _updateState();
  }

  void deleteTransaction(selectedTransaction selectedTx) {
    _transactions[selectedTx.mainIdx].txList.removeAt(selectedTx.index);
    var spentAmount = selectedTx.txItem.amount;
    if (selectedTx.txItem.isIncome) {
      _transactions[selectedTx.mainIdx].income -= spentAmount;
      _transactions[selectedTx.mainIdx].balance -= spentAmount;
    } else {
      if (selectedTx.txItem.paymentMode == 'CREDIT_CARD') {
        _transactions[0].creditCardUsage -= spentAmount;
      } else {
        _transactions[selectedTx.mainIdx].balance += spentAmount;
        _transactions[selectedTx.mainIdx].spent -= spentAmount;
      }
    }

    _updateState();
  }

  int _idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch;
  }

  String numToCurrency(amount) {
    return _currency.format(amount);
  }

  Future _loadDataFromStorage() async {
    await _prefs.then((prefs) => prefs.getString(_storageKey)).then((val) {
      if (val != null) {
        var data = json.decode(val) as List<dynamic>;
        _transactions.removeRange(0, _transactions.length);
        data.forEach((d) {
          _transactions.add(Transaction.fromJson(d));
        });
        notifyListeners();
      }
    });
  }

  Future _saveDataToStorage() async {
    await _prefs.then(
      (prefs) {
        prefs.setString(_storageKey, jsonEncode(_transactions));
      },
    );
  }

  List<Transaction> getTxnsHistory() {
    var encoded = json.encode(_transactions);
    var decoded = json.decode(encoded) as List;
    List<Transaction> item = [];
    decoded.forEach((element) {
      item.add(Transaction.fromJson(element));
    });
    return item;
  }

  void _updateState() {
    notifyListeners();
    _saveDataToStorage();
  }

  Future clearStorage() async {
    await _prefs.then(
      (prefs) {
        prefs.remove(_storageKey);
      },
    );
  }
}
