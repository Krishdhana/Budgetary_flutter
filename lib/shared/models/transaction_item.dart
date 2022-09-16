import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_item.freezed.dart';
part 'transaction_item.g.dart';

@unfreezed
class TransItem with _$TransItem {
  factory TransItem({
    @Default(0) num id,
    required String name,
    required num amount,
    required bool isIncome,
    required final DateTime date,
    required String paymentMode,
  }) = _TransItem;

  factory TransItem.fromJson(json) => _$TransItemFromJson(json);
}
