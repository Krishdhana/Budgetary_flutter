// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  int get appColor => throw _privateConstructorUsedError;
  set appColor(int value) => throw _privateConstructorUsedError;
  bool get useWallpaperColor => throw _privateConstructorUsedError;
  set useWallpaperColor(bool value) => throw _privateConstructorUsedError;
  UserDetails get userDetails => throw _privateConstructorUsedError;
  set userDetails(UserDetails value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res>;
  $Res call({int appColor, bool useWallpaperColor, UserDetails userDetails});

  $UserDetailsCopyWith<$Res> get userDetails;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res> implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  final AppSettings _value;
  // ignore: unused_field
  final $Res Function(AppSettings) _then;

  @override
  $Res call({
    Object? appColor = freezed,
    Object? useWallpaperColor = freezed,
    Object? userDetails = freezed,
  }) {
    return _then(_value.copyWith(
      appColor: appColor == freezed
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as int,
      useWallpaperColor: useWallpaperColor == freezed
          ? _value.useWallpaperColor
          : useWallpaperColor // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: userDetails == freezed
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ));
  }

  @override
  $UserDetailsCopyWith<$Res> get userDetails {
    return $UserDetailsCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value));
    });
  }
}

/// @nodoc
abstract class _$$_AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$_AppSettingsCopyWith(
          _$_AppSettings value, $Res Function(_$_AppSettings) then) =
      __$$_AppSettingsCopyWithImpl<$Res>;
  @override
  $Res call({int appColor, bool useWallpaperColor, UserDetails userDetails});

  @override
  $UserDetailsCopyWith<$Res> get userDetails;
}

/// @nodoc
class __$$_AppSettingsCopyWithImpl<$Res> extends _$AppSettingsCopyWithImpl<$Res>
    implements _$$_AppSettingsCopyWith<$Res> {
  __$$_AppSettingsCopyWithImpl(
      _$_AppSettings _value, $Res Function(_$_AppSettings) _then)
      : super(_value, (v) => _then(v as _$_AppSettings));

  @override
  _$_AppSettings get _value => super._value as _$_AppSettings;

  @override
  $Res call({
    Object? appColor = freezed,
    Object? useWallpaperColor = freezed,
    Object? userDetails = freezed,
  }) {
    return _then(_$_AppSettings(
      appColor: appColor == freezed
          ? _value.appColor
          : appColor // ignore: cast_nullable_to_non_nullable
              as int,
      useWallpaperColor: useWallpaperColor == freezed
          ? _value.useWallpaperColor
          : useWallpaperColor // ignore: cast_nullable_to_non_nullable
              as bool,
      userDetails: userDetails == freezed
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppSettings implements _AppSettings {
  _$_AppSettings(
      {required this.appColor,
      this.useWallpaperColor = true,
      required this.userDetails});

  factory _$_AppSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingsFromJson(json);

  @override
  int appColor;
  @override
  @JsonKey()
  bool useWallpaperColor;
  @override
  UserDetails userDetails;

  @override
  String toString() {
    return 'AppSettings(appColor: $appColor, useWallpaperColor: $useWallpaperColor, userDetails: $userDetails)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      __$$_AppSettingsCopyWithImpl<_$_AppSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingsToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  factory _AppSettings(
      {required int appColor,
      bool useWallpaperColor,
      required UserDetails userDetails}) = _$_AppSettings;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$_AppSettings.fromJson;

  @override
  int get appColor;
  set appColor(int value);
  @override
  bool get useWallpaperColor;
  set useWallpaperColor(bool value);
  @override
  UserDetails get userDetails;
  set userDetails(UserDetails value);
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
