import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/property/property_content.dart';
import 'package:pinkpig_project_flutter/ui/main/result/components/property/property_title.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertyTitle(),
        PropertyContent()
      ],
    );
  }
}
