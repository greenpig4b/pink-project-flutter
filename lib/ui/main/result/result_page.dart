
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_app_bar.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/result_body.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: ResultAppBar(),
      body: ResultBody(),
    );
  }
}