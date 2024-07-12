
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_app_bar.dart';
import 'components/result_body_top.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResultAppBar(),
      body: ResultBodyTop(),
    );
  }
}