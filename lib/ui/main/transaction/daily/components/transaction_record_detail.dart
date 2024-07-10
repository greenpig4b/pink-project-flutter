import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinkpig_project_flutter/ui/main/transaction/daily/viewmodel/transaction_list_viewmodel.dart';
import '../../../../../data/dtos/transaction/ListDummy.dart';
import '../../../../components/under_line_widget.dart';
import '../transaction_write_page.dart';
import 'transaction_list.dart';

class TransactionRecordDetail extends StatelessWidget {
  final TransactionListModel? model;

  const TransactionRecordDetail({super.key, this.model});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // 원형 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => TransactionWritePage()),
          );
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
          itemCount: model?.dailyTransactionDTO?.length,
          itemBuilder: (BuildContext context, int index) {

            final dailyTransaction = model!.dailyTransactionDTO?[index] ;

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
                              "${dailyTransaction?.date}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("${dailyTransaction?.dailyIncome}", style: TextStyle(color: Colors.blue)),
                            Text(
                              "${dailyTransaction?.dailyExpense}",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      UnderLineWidget(),
                      TransactionList(dailyTransactionDetailDTO: dailyTransaction!.dailyTransactionDetailDTO),
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
