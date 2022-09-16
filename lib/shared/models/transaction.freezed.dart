// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  DateTime get period => throw _privateConstructorUsedError;
  List<TransItem> get txList => throw _privateConstructorUsedError;
  set txList(List<TransItem> value) => throw _privateConstructorUsedError;
  num get creditCardUsage => throw _privateConstructorUsedError;
  set creditCardUsage(num value) => throw _privateConstructorUsedError;
  num get balance => throw _privateConstructorUsedError;
  set balance(num value) => throw _privateConstructorUsedError;
  num get income => throw _privateConstructorUsedError;
  set income(num value) => throw _privateConstructorUsedError;
  num get spent => throw _privateConstructorUsedError;
  set spent(num value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {DateTime period,
      List<TransItem> txList,
      num creditCardUsage,
      num balance,
      num income,
      num spent});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? period = freezed,
    Object? txList = freezed,
    Object? creditCardUsage = freezed,
    Object? balance = freezed,
    Object? income = freezed,
    Object? spent = freezed,
  }) {
    return _then(_value.copyWith(
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      txList: txList == freezed
          ? _value.txList
          : txList // ignore: cast_nullable_to_non_nullable
              as List<TransItem>,
      creditCardUsage: creditCardUsage == freezed
          ? _value.creditCardUsage
          : creditCardUsage // ignore: cast_nullable_to_non_nullable
              as num,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      income: income == freezed
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as num,
      spent: spent == freezed
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime period,
      List<TransItem> txList,
      num creditCardUsage,
      num balance,
      num income,
      num spent});
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, (v) => _then(v as _$_Transaction));

  @override
  _$_Transaction get _value => super._value as _$_Transaction;

  @override
  $Res call({
    Object? period = freezed,
    Object? txList = freezed,
    Object? creditCardUsage = freezed,
    Object? balance = freezed,
    Object? income = freezed,
    Object? spent = freezed,
  }) {
    return _then(_$_Transaction(
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      txList: txList == freezed
          ? _value.txList
          : txList // ignore: cast_nullable_to_non_nullable
              as List<TransItem>,
      creditCardUsage: creditCardUsage == freezed
          ? _value.creditCardUsage
          : creditCardUsage // ignore: cast_nullable_to_non_nullable
              as num,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      income: income == freezed
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as num,
      spent: spent == freezed
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  _$_Transaction(
      {required this.period,
      required this.txList,
      this.creditCardUsage = 0,
      this.balance = 0,
      this.income = 0,
      this.spent = 0});

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final DateTime period;
  @override
  List<TransItem> txList;
  @override
  @JsonKey()
  num creditCardUsage;
  @override
  @JsonKey()
  num balance;
  @override
  @JsonKey()
  num income;
  @override
  @JsonKey()
  num spent;

  @override
  String toString() {
    return 'Transaction(period: $period, txList: $txList, creditCardUsage: $creditCardUsage, balance: $balance, income: $income, spent: $spent)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  factory _Transaction(
      {required final DateTime period,
      required List<TransItem> txList,
      num creditCardUsage,
      num balance,
      num income,
      num spent}) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  DateTime get period;
  @override
  List<TransItem> get txList;
  set txList(List<TransItem> value);
  @override
  num get creditCardUsage;
  set creditCardUsage(num value);
  @override
  num get balance;
  set balance(num value);
  @override
  num get income;
  set income(num value);
  @override
  num get spent;
  set spent(num value);
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
