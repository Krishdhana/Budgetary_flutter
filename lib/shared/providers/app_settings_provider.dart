import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../shared/models/user_details.dart';

class AppSettingsProvider with ChangeNotifier {
  UserDetails _ud = UserDetails(username: 'K', role: 'K');
  Color _appColor = Colors.red.shade600;

  final String _storageKey = 'UserDetails';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void updateUserData({username, role}) {
    var newUD = _ud.copyWith(username: username, role: role);
    _ud = newUD;

    _saveState();
  }

  AppSettingsProvider() {
    _loadDetailsFromStorage();
  }

  UserDetails getUserData() {
    var d = _ud.toJson();
    return UserDetails.fromJson(d);
  }

  void _loadDetailsFromStorage() {
    _prefs.then((pref) {
      var d = pref.getString(_storageKey);
      if (d != null) {
        _ud = UserDetails.fromJson(json.decode(d));
        notifyListeners();
      }
    });
  }

  void updateAppColor(Color color) {
    _appColor = color;

    notifyListeners();
  }

  Color get appColor {
    return _appColor;
  }

  void _saveState() {
    _prefs.then((pref) {
      var ud = json.encode(_ud);
      pref.setString(_storageKey, ud);
    });

    notifyListeners();
  }
}
