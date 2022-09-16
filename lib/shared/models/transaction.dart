import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction_item.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@unfreezed
class Transaction with _$Transaction {
  factory Transaction({
    required final DateTime period,
    required List<TransItem> txList,
    @Default(0) num creditCardUsage,
    @Default(0) num balance,
    @Default(0) num income,
    @Default(0) num spent,
  }) = _Transaction;

  factory Transaction.fromJson(json) => _$TransactionFromJson(json);

  factory Transaction.clone({required Transaction obj}) {
    return Transaction(
      period: obj.period,
      txList: [...obj.txList],
      balance: obj.balance,
      creditCardUsage: obj.creditCardUsage,
      income: obj.income,
      spent: obj.spent,
    );
  }
}
