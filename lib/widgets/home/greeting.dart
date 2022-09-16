import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greeting extends StatelessWidget {
  final String _username;

  const Greeting(this._username, {super.key});

  String get greeting {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                  letterSpacing: 1,
                ),
              ),
              Text(
                _username,
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor.withAlpha(200),
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            DateFormat('dd MMM').format(DateTime.now()),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
