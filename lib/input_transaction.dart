import 'package:flutter/material.dart';

class UserInputTransaction extends StatefulWidget {

  final Function addTx;
  const UserInputTransaction({
    Key? key, required this.addTx,
  }) : super(key: key);

  @override
  State<UserInputTransaction> createState() => _UserInputTransactionState();
}

class _UserInputTransactionState extends State<UserInputTransaction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
           controller: titleController,
          decoration:const InputDecoration(
            labelText:'Tittle'
          ) ,
        ),
         TextField(
          controller:amountController ,
          decoration:const InputDecoration(
              labelText:'Amount'
          ) ,
        ),
        ElevatedButton(
            onPressed:(){ widget.addTx(titleController, amountController);
              Navigator.of(context).pop();
              }, child: const Text('Add')),
      ],
    );
  }


}