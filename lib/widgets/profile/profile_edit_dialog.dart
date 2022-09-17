import 'package:Budgetary/shared/models/user_details.dart';
import 'package:Budgetary/shared/providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditDialog extends StatefulWidget {
  late UserDetails userDetails;

  ProfileEditDialog({super.key, required this.userDetails});

  @override
  State<ProfileEditDialog> createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.userDetails.username;
    _roleController.text = widget.userDetails.role;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    var updateUserData =
        Provider.of<AppSettingsProvider>(context).updateUserData;

    return AlertDialog(
      title: const Text('Edit Profile'),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _nameController,
              maxLength: 10,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.badge_outlined),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                label: const Text(
                  'Nick Name',
                ),
                filled: true,
                fillColor: color.withAlpha(30),
              ),
            ),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.badge_outlined),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                label: const Text(
                  'Role',
                ),
                filled: true,
                fillColor: color.withAlpha(30),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            updateUserData(
                username: _nameController.text, role: _roleController.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
