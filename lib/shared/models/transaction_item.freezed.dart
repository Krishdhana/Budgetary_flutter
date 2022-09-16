// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransItem _$TransItemFromJson(Map<String, dynamic> json) {
  return _TransItem.fromJson(json);
}

/// @nodoc
mixin _$TransItem {
  num get id => throw _privateConstructorUsedError;
  set id(num value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  set amount(num value) => throw _privateConstructorUsedError;
  bool get isIncome => throw _privateConstructorUsedError;
  set isIncome(bool value) => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get paymentMode => throw _privateConstructorUsedError;
  set paymentMode(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransItemCopyWith<TransItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransItemCopyWith<$Res> {
  factory $TransItemCopyWith(TransItem value, $Res Function(TransItem) then) =
      _$TransItemCopyWithImpl<$Res>;
  $Res call(
      {num id,
      String name,
      num amount,
      bool isIncome,
      DateTime date,
      String paymentMode});
}

/// @nodoc
class _$TransItemCopyWithImpl<$Res> implements $TransItemCopyWith<$Res> {
  _$TransItemCopyWithImpl(this._value, this._then);

  final TransItem _value;
  // ignore: unused_field
  final $Res Function(TransItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? isIncome = freezed,
    Object? date = freezed,
    Object? paymentMode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      isIncome: isIncome == freezed
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMode: paymentMode == freezed
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TransItemCopyWith<$Res> implements $TransItemCopyWith<$Res> {
  factory _$$_TransItemCopyWith(
          _$_TransItem value, $Res Function(_$_TransItem) then) =
      __$$_TransItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {num id,
      String name,
      num amount,
      bool isIncome,
      DateTime date,
      String paymentMode});
}

/// @nodoc
class __$$_TransItemCopyWithImpl<$Res> extends _$TransItemCopyWithImpl<$Res>
    implements _$$_TransItemCopyWith<$Res> {
  __$$_TransItemCopyWithImpl(
      _$_TransItem _value, $Res Function(_$_TransItem) _then)
      : super(_value, (v) => _then(v as _$_TransItem));

  @override
  _$_TransItem get _value => super._value as _$_TransItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? isIncome = freezed,
    Object? date = freezed,
    Object? paymentMode = freezed,
  }) {
    return _then(_$_TransItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      isIncome: isIncome == freezed
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMode: paymentMode == freezed
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransItem implements _TransItem {
  _$_TransItem(
      {this.id = 0,
      required this.name,
      required this.amount,
      required this.isIncome,
      required this.date,
      required this.paymentMode});

  factory _$_TransItem.fromJson(Map<String, dynamic> json) =>
      _$$_TransItemFromJson(json);

  @override
  @JsonKey()
  num id;
  @override
  String name;
  @override
  num amount;
  @override
  bool isIncome;
  @override
  final DateTime date;
  @override
  String paymentMode;

  @override
  String toString() {
    return 'TransItem(id: $id, name: $name, amount: $amount, isIncome: $isIncome, date: $date, paymentMode: $paymentMode)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TransItemCopyWith<_$_TransItem> get copyWith =>
      __$$_TransItemCopyWithImpl<_$_TransItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransItemToJson(
      this,
    );
  }
}

abstract class _TransItem implements TransItem {
  factory _TransItem(
      {num id,
      required String name,
      required num amount,
      required bool isIncome,
      required final DateTime date,
      required String paymentMode}) = _$_TransItem;

  factory _TransItem.fromJson(Map<String, dynamic> json) =
      _$_TransItem.fromJson;

  @override
  num get id;
  set id(num value);
  @override
  String get name;
  set name(String value);
  @override
  num get amount;
  set amount(num value);
  @override
  bool get isIncome;
  set isIncome(bool value);
  @override
  DateTime get date;
  @override
  String get paymentMode;
  set paymentMode(String value);
  @override
  @JsonKey(ignore: true)
  _$$_TransItemCopyWith<_$_TransItem> get copyWith =>
      throw _privateConstructorUsedError;
}
