import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_example/providers/transaction_provider.dart';
import 'dart:developer' as dev_log;
import 'bar_design.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupTxData = context.watch<TransactionProvider>().groupedTransaction;
    final transactionData = context.watch<TransactionProvider>().totalSpending;

    dev_log.log(transactionData.toString(), name: 'total SPENDING');

    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: groupTxData.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarDesign(
                amountLabel: data['amount'] as double,
                dayLabel: data['day'] as String,
                spendingPercentTotal: transactionData == 0.0
                    ? 0.0
                    : ((data['amount'] as double) / transactionData),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
