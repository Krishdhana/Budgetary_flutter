import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/selected_Transaction.dart';
import '../models/transaction.dart';

class TxListProvider with ChangeNotifier {
  final List<Transaction> _expenses = [];
  final _currency = NumberFormat.currency(
      name: 'INR', symbol: '₹', locale: 'en-IN', decimalDigits: 0);

  final String _key = 'txList';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TxListProvider() {
    _loadDataFromStorage();
  }

  Transaction get getRecentTransactions {
    if (_expenses.isNotEmpty)
      return Transaction.clone(obj: _expenses[0]);
    else
      return Transaction(period: DateTime.now(), txList: []);
  }

  void onAddTransaction(tx) {
    tx.id = _idGenerator();
    var currentTime = DateTime.now();

    if (_expenses.isEmpty ||
        DateFormat('MMMM').format(_expenses[0].period) !=
            DateFormat('MMMM').format(currentTime)) {
      var exp = Transaction(
        txList: [],
        period: DateTime.now(),
      );
      _expenses.insert(0, exp);
    }

    _expenses[0].txList.insert(0, tx);
    if (tx.isIncome) {
      _expenses[0].balance += tx.amount;
      _expenses[0].income += tx.amount;
    } else {
      if (tx.paymentMode == 'CREDIT_CARD') {
        _expenses[0].creditCardUsage += tx.amount;
      } else {
        _expenses[0].balance -= tx.amount;
        _expenses[0].spent += tx.amount;
      }
    }
    _updateState();
  }

  void updateTransaction(selectedTransaction selectedTx) {
    var oldAmount =
        _expenses[selectedTx.mainIdx].txList[selectedTx.index].amount;

    if (selectedTx.txItem.amount !=
        _expenses[selectedTx.mainIdx].txList[selectedTx.index].amount) {
      var diffAmount = oldAmount - selectedTx.txItem.amount;

      if (selectedTx.txItem.isIncome) {
        _expenses[0].balance += diffAmount;
        _expenses[0].income += diffAmount;
      } else {
        if (selectedTx.txItem.paymentMode == 'CREDIT_CARD') {
          _expenses[0].creditCardUsage += diffAmount;
        } else {
          _expenses[0].balance -= diffAmount;
          _expenses[0].spent += diffAmount;
        }
      }
    }

    _expenses[selectedTx.mainIdx].txList[selectedTx.index] = selectedTx.txItem;

    notifyListeners();
  }

  void deleteTransaction(selectedTransaction selectedTx) {
    _expenses[selectedTx.mainIdx].txList.removeAt(selectedTx.index);
    var spentAmount = selectedTx.txItem.amount;
    if (selectedTx.txItem.isIncome) {
      _expenses[selectedTx.mainIdx].income -= spentAmount;
      _expenses[selectedTx.mainIdx].balance -= spentAmount;
    } else {
      if (selectedTx.txItem.paymentMode == 'CREDIT_CARD') {
        _expenses[0].creditCardUsage -= spentAmount;
      } else {
        _expenses[selectedTx.mainIdx].balance += spentAmount;
        _expenses[selectedTx.mainIdx].spent -= spentAmount;
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
    await _prefs.then((prefs) => prefs.getString(_key)).then((val) {
      if (val != null) {
        var data = json.decode(val) as List<dynamic>;
        _expenses.removeRange(0, _expenses.length);
        data.forEach((d) {
          _expenses.add(Transaction.fromJson(d));
        });
        notifyListeners();
      }
    });
  }

  Future _saveDataToStorage() async {
    await _prefs.then(
      (prefs) {
        prefs.setString(_key, jsonEncode(_expenses));
      },
    );
  }

  Future clearStorage() async {
    await _prefs.then(
      (prefs) {
        prefs.remove(_key);
      },
    );
  }

  List<Transaction> getTxnsHistory() {
    var encoded = json.encode(_expenses);
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
}
