import 'package:Budgetary/shared/models/user_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@unfreezed
class AppSettings with _$AppSettings {
  factory AppSettings(
      {required int appColor,
      @Default(true) bool useWallpaperColor,
      required UserDetails userDetails}) = _AppSettings;

  factory AppSettings.fromJson(json) => _$AppSettingsFromJson(json);
}
