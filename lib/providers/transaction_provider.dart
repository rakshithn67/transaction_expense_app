import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transaction = [];

  List<Transaction> get transaction => _transaction;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final bool _selected = false;
  //
  // late DateTime _initialDate = DateTime.now();
  //
  // DateTime get initialDate => _initialDate;

  // DateTime? _selectedDate = DateTime.now() ;

  //     final DateTime _pickedDate = DateTime.now() ;
  //
  // DateTime get pickedDate => _pickedDate;

  TextEditingController get titleController => _titleController;

  TextEditingController get amountController => _amountController;

  bool get selected => _selected;

  int get transactLength => _transaction.length;

  addTransaction(
    TextEditingController titleController,
    TextEditingController amountController,
    DateTime selectedDate,
  ) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        tittle: titleController.text,
        amount: double.parse(amountController.text),
        date: selectedDate);
    _transaction.add(newTx);
    notifyListeners();
  }

  deleteTransaction(String transactionId) {
    _transaction.removeWhere((tx) => tx.id == transactionId);
    notifyListeners();
  }

  List<Transaction> get _recentTransactions {
    return _transaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      // double value = 0;
      for (int i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekDay.day &&
            _recentTransactions[i].date.month == weekDay.month &&
            _recentTransactions[i].date.year == weekDay.year) {
          totalSum += _recentTransactions[i].amount;
          // value = _recentTransactions.fold(totalSum,
          //     (previousValue, element) => previousValue + element.amount);
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransaction.fold(
      0.0,
      (previousValue, item) {
        return previousValue + (item['amount'] as double);
      },
    );
  }

  clearController() {
    _titleController.clear();
    _amountController.clear();
  }

  // datePicked(DateTime date,) {
  //   _selectedDate = date;
  //   dev_log.log(_selectedDate.toString(), name: 'datePicked');
  //   notifyListeners();
  // }
  //
  // get selectedDate => _selectedDate;

  // // datePicked(DateTime date) {
  // //   _initialDate = date;
  // //   notifyListeners();
  // }
  // showDate(BuildContext context) async {
  //   final date = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime.now(),
  //   );
  //
  //   if (date != null) {
  //     return _initialDate = date;
  //   }
  //   notifyListeners();
  // }
}
