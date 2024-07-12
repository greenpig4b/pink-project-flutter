import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({
    super.key,
    required String selectedDayNum,
    required String selectedYear,
    required String selectedMonth,
    required String selectedWeekday,
  }) : _selectedDayNum = selectedDayNum, _selectedYear = selectedYear, _selectedMonth = selectedMonth, _selectedWeekday = selectedWeekday;

  final String _selectedDayNum;
  final String _selectedYear;
  final String _selectedMonth;
  final String _selectedWeekday;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                "$_selectedDayNum",
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_selectedYear. $_selectedMonth.",
                    style: TextStyle(fontSize: 13),
                  ),
                  Container(
                    width: 45,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Color(0xB6B7B7B7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "$_selectedWeekday",
                        style: TextStyle(
                            fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/icons/heart-regular.svg',
          width: 20,
          height: 20,
        ),
      ],
    );
  }
}