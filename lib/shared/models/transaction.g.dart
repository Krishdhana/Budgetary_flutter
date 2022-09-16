// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      period: DateTime.parse(json['period'] as String),
      txList: (json['txList'] as List<dynamic>)
          .map((e) => TransItem.fromJson(e))
          .toList(),
      creditCardUsage: json['creditCardUsage'] as num? ?? 0,
      balance: json['balance'] as num? ?? 0,
      income: json['income'] as num? ?? 0,
      spent: json['spent'] as num? ?? 0,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'period': instance.period.toIso8601String(),
      'txList': instance.txList,
      'creditCardUsage': instance.creditCardUsage,
      'balance': instance.balance,
      'income': instance.income,
      'spent': instance.spent,
    };
