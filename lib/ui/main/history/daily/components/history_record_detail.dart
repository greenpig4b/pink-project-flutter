import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/history/ListDummy.dart';
import '../../../../components/under_line_widget.dart';
import 'history_list.dart';

class HistoryRecordDetail extends StatelessWidget {
  const HistoryRecordDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 원형 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,MaterialPageRoute(builder: (context) => RecordWritePage()),
          // );
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFFFF6254),
        shape: CircleBorder(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (BuildContext context, int index) {
            final record = historyList[index];
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${record['date']}일",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("${record['income']}원", style: TextStyle(color: Colors.blue)),
                            Text(
                              "${record['outgo']}원",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      UnderLineWidget(),
                      HistoryList(items: record['records']),
                      SizedBox(
                        height: 8,
                        child: Container(
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
