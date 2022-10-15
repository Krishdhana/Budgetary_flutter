// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      appColor: json['appColor'] as int,
      useWallpaperColor: json['useWallpaperColor'] as bool? ?? true,
      userDetails:
          UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'appColor': instance.appColor,
      'useWallpaperColor': instance.useWallpaperColor,
      'userDetails': instance.userDetails,
    };
