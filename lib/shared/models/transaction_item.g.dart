// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransItem _$$_TransItemFromJson(Map<String, dynamic> json) => _$_TransItem(
      id: json['id'] as num? ?? 0,
      name: json['name'] as String,
      amount: json['amount'] as num,
      isIncome: json['isIncome'] as bool,
      date: DateTime.parse(json['date'] as String),
      paymentMode: json['paymentMode'] as String,
    );

Map<String, dynamic> _$$_TransItemToJson(_$_TransItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'isIncome': instance.isIncome,
      'date': instance.date.toIso8601String(),
      'paymentMode': instance.paymentMode,
    };
