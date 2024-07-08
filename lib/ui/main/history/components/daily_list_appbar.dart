import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.settings, color: Colors.white),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
