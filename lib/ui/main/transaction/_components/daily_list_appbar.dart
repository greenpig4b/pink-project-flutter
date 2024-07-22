import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../setting/setting_page.dart';

class DailyListAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DailyListAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFC7C9A),
      elevation: 0.0,
      leading: const Icon(CupertinoIcons.search, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => SettingPage()));
            }
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
