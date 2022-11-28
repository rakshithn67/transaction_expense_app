import 'package:flutter/material.dart';
import 'dart:developer' as dev_log;

class BarDesign extends StatelessWidget {
  final double amountLabel;
  final String dayLabel;
  final double spendingPercentTotal;

  // final double spendingPercentTotal;

  const BarDesign({
    Key? key,
    required this.amountLabel,
    required this.dayLabel, required this.spendingPercentTotal,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev_log.log( spendingPercentTotal.toString(),name:'percentage SPENDING' );

    return Column(
      children: [
        Container(height: 20 ,child: FittedBox(child: Text(amountLabel.toStringAsFixed(0)))),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentTotal ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(dayLabel),
      ],
    );
  }
}
