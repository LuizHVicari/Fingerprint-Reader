import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GatherCart extends StatelessWidget {
  final String code;
  final String date;
  final int months;
  const GatherCart({super.key, required this.code, required this.date, required this.months});

  @override
  Widget build(BuildContext context) {
    return 
     Card(
      margin: const EdgeInsets.only(top: 24, bottom: 8, left: 12, right: 12),
      child: Container(
        width: 300,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              child: Icon(
                Icons.fingerprint, 
                color: Colors.white,
                size: 50)
            ),
            babyCodeDateColumn(code: code, date: date),
            babyMonthsColumn(months: months)
          ],
        )
      )
    );
  }

  Column babyMonthsColumn({required int months}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(
          months.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        Text(
          'Meses',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white
          ),
        ),
      ],
    );
  }

  Column babyCodeDateColumn({required String code, required String date}) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          'Bebê: $code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
        Text(
          'Coleta feita em ${formatter.format(DateTime.parse(date))}',
          style: TextStyle(
            color: Colors.white
          ),)
      ],
    );
  }
}