import 'package:flutter/material.dart';
import '../providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionData = context.watch<TransactionProvider>();
    return Expanded(
      child: transactionData.transaction.isNotEmpty
          ? ListView.builder(
              itemCount: transactionData.transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(transactionData.transaction[index].tittle),
                    subtitle: Text(DateFormat.yMd()
                        .format(transactionData.transaction[index].date)),
                    leading: Tooltip(
                      triggerMode: TooltipTriggerMode.tap,
                      message:
                          transactionData.transaction[index].amount.toString(),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CircleAvatar(
                          backgroundColor: Colors.black87,
                          child: Text(
                            transactionData.transaction[index].amount
                                .toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        transactionData.deleteTransaction(
                            transactionData.transaction[index].id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                    ),
                  ),
                );
              },
            )
          : Container(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      ' " No Transaction Added Yet! " ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset('asset/images/waiting.png'),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
