import 'package:Budgetary/shared/models/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../shared/models/user_details.dart';

class AppSettingsProvider with ChangeNotifier {
  AppSettings _appSettings = AppSettings(
    appColor: Colors.red.value,
    userDetails: UserDetails(role: 'K', username: 'K'),
  );

  final String _storageKey = 'appSettings';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void updateUserData({username, role}) {
    var newUD =
        _appSettings.userDetails.copyWith(username: username, role: role);
    _appSettings.userDetails = newUD;

    _saveState();
  }

  AppSettingsProvider() {
    _loadDetailsFromStorage();
  }

  UserDetails getUserData() {
    var ud = _appSettings.userDetails.toJson();
    return UserDetails.fromJson(ud);
  }

  void useWallpaperColor(val) {
    _appSettings.useWallpaperColor = val;

    _saveState();
  }

  void _loadDetailsFromStorage() {
    _prefs.then((pref) {
      var d = pref.getString(_storageKey);
      if (d != null) {
        _appSettings = AppSettings.fromJson(json.decode(d));
        notifyListeners();
      }
    });
  }

  void updateAppColor(Color color) {
    _appSettings.appColor = color.value;

    _saveState();
  }

  bool get useColorFromWallpaper {
    return _appSettings.useWallpaperColor;
  }

  Color get appColor {
    return Color(_appSettings.appColor);
  }

  void _saveState() {
    _prefs.then((pref) {
      var as = json.encode(_appSettings);
      pref.setString(_storageKey, as);
    });

    notifyListeners();
  }

  void clearAppSettings() {
    _prefs.then((pref) {
      pref.remove(_storageKey);
    });
  }
}
