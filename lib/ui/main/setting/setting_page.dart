import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinkpig_project_flutter/ui/components/under_line_widget.dart';

import 'faq/faq_page.dart';
import 'notice/notice_page.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoticePage()));
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.bullhorn, size: 24.0),
                    SizedBox(width: 10),
                    Text(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FaqPage()));
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                   Icon(Icons.help_outline, size: 24.0),
                    SizedBox(width: 10),
                    Text(
                      "자주 묻는 질문",
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

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFFFC7C9A),
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text("설정",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
      ),
    ],
  );
}
