import 'package:flutter/material.dart';
import 'package:untitled_example/transaction.dart';

class ListInput extends StatelessWidget {
  const ListInput({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(transaction[index].title),
              leading: FittedBox(
                fit: BoxFit.fill,
                child: CircleAvatar(
                  child: Text(transaction[index].amount.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}