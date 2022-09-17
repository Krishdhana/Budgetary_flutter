import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../shared/models/user_details.dart';
import '../shared/providers/app_settings_provider.dart';
import '../widgets/profile/profile_edit_dialog.dart';

import '../shared/providers/txList_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    late Color selectedColor;
    UserDetails userData =
        Provider.of<AppSettingsProvider>(context).getUserData();

    var _pickedcolor;

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
                  Navigator.pop(context);
                  context
                      .read<AppSettingsProvider>()
                      .updateAppColor(selectedColor);
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
            title: Text(userData.username),
            subtitle: Text(userData.role),
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
                          ProfileEditDialog(userDetails: userData),
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
          TextButton(
            onPressed: () {
              context.read<TxListProvider>().clearStorage();
              // SystemNavigator.pop();
            },
            child: const Text('Clear all data'),
          ),
        ],
      ),
    );
  }
}
