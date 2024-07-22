import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinkpig_project_flutter/ui/components/under_line_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            UnderLineWidget(),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => NoticePage()));
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.bullhorn, size: 24.0),
                    const SizedBox(width: 10),
                    const Text(
                      "공지사항",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            UnderLineWidget(),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => FaqPage()));
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.help_outline, size: 24.0),
                    const SizedBox(width: 10),
                    const Text(
                      "FAQ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            UnderLineWidget(),
          ],
        ),
      ),
    );
  }
}
