import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../shared/models/user_details.dart';
import '../shared/providers/app_settings_provider.dart';
import '../widgets/profile/profile_edit_dialog.dart';

import '../shared/providers/txList_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    late Color selectedColor;
    var settingsProvider = Provider.of<AppSettingsProvider>(context);
    UserDetails userDetails = settingsProvider.getUserData();

    void _showColorPicker() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Choose a color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                  pickerColor: color,
                  onColorChanged: (value) => selectedColor = value),
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('Choose'),
                onPressed: () {
                  settingsProvider.updateAppColor(selectedColor);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    void _clearData() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Confirmation'),
                content: const Text(
                    'This will delete all the data and reset the app!'),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Sure'),
                    onPressed: () {
                      context.read<TxListProvider>().clearStorage();
                      settingsProvider.clearAppSettings();
                      SystemNavigator.pop();
                    },
                    // },
                  ),
                ],
              ));
    }

    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: double.infinity,
            child: const Text('Settings',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withAlpha(50),
              radius: 25,
              child: Icon(
                Icons.person,
                color: color,
              ),
            ),
            title: Text(userDetails.username),
            subtitle: Text(userDetails.role),
            trailing: IconButton(
              icon: Icon(
                Icons.edit,
                size: 18,
                color: color,
              ),
              onPressed: (() => {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          ProfileEditDialog(userDetails: userDetails),
                    )
                  }),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'App Color',
              style: TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.color_lens,
                size: 25,
                color: color,
              ),
              onPressed: _showColorPicker,
            ),
          ),
          CheckboxListTile(
              title: const Text('Pick Color From Wallpaper'),
              subtitle: const Text('Only works on Android 12 above'),
              value: settingsProvider.useColorFromWallpaper,
              onChanged: ((value) =>
                  settingsProvider.useWallpaperColor(value))),
          TextButton(
            onPressed: _clearData,
            child: const Text('Clear all data'),
          ),
        ],
      ),
    );
  }
}
