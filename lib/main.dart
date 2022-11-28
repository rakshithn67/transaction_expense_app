// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'counter_provider.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     final counterData = context.watch<CounterProvider>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               counterData.counter.toString(),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           counterData.incrementCounter();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:untitled_example/transaction.dart';
//
// import 'input_transaction.dart';
// import 'list_input.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Example',
//       home: Example(),
//     );
//   }
// }
//
// class Example extends StatefulWidget {
//   const Example({Key? key}) : super(key: key);
//
//   @override
//   State<Example> createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   List<Transaction> transaction = [
//     // Transaction(title: 'New Shoes', amount: 89.99),
//     // Transaction(title: 'Watches', amount: 99.99),
//   ];
//   TextEditingController titleController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//
//   void addTransaction(TextEditingController titleController,
//       TextEditingController amountController) {
//     final newTx = Transaction(
//         title: titleController.text,
//         amount: double.parse(amountController.text));
//     setState(() {
//       transaction.add(newTx);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             ListInput(transaction: transaction),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: bottomSheet,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   void bottomSheet() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return UserInputTransaction(
//             addTx: addTransaction,
//           );
//           // return Padding(
//           //   padding: const EdgeInsets.all(10),
//           //   child: Column(
//           //     children: [
//           //       TextField(
//           //         controller: titleController,
//           //         decoration:const InputDecoration(
//           //             labelText:'Tittle'
//           //         ) ,
//           //       ),
//           //       TextField(
//           //         controller:amountController ,
//           //         decoration:const InputDecoration(
//           //             labelText:'Amount'
//           //         ) ,
//           //       ),
//           //       ElevatedButton(
//           //           onPressed:()=> addTransaction(titleController, amountController), child: const Text('Add')),
//           //     ],
//           //   ),
//           // );
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_example/providers/transaction_provider.dart';
import 'package:untitled_example/widgets/bar_chart.dart';
import 'package:untitled_example/widgets/transaction_list_view_widget.dart';
import 'package:intl/intl.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: SafeArea(
        child: AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 4)),
                  child:
                      Image.asset('asset/splash_screen/icons-transaction.png')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Expense Tracker',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
          nextScreen: const MyApp(),
          duration: 3000,
          splashIconSize: 300,
          animationDuration: const Duration(seconds: 1),
          splashTransition: SplashTransition.sizeTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          centered: true,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider())
      ],
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.redAccent,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.redAccent)),
          debugShowCheckedModeBanner: false,
          title: 'Example',
          home: const SafeArea(child: ExampleProvider())),
    );
  }
}

class ExampleProvider extends StatefulWidget {
  const ExampleProvider({Key? key}) : super(key: key);

  @override
  State<ExampleProvider> createState() => _ExampleProviderState();
}

class _ExampleProviderState extends State<ExampleProvider> {
  final amountFocus = FocusNode();

  late DateTime _selectedDate = DateTime.now();

  late bool _selected = false;

  @override
  Widget build(BuildContext context) {
    final titleControllerData =
        context.read<TransactionProvider>().titleController;
    final amountControllerData =
        context.read<TransactionProvider>().amountController;

    final transactionData = context.watch<TransactionProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Expense Tracker'),
      ),
      body: Center(
        child: Column(
          children: const [BarChart(), TransactionListView()],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTransactionAdd(
          titleControllerData,
          amountControllerData,
          transactionData,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  showTransactionAdd(
    TextEditingController titleController,
    TextEditingController amountController,
    TransactionProvider transactionData,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.next,
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Tittle'),
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(amountFocus);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                focusNode: amountFocus,
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selected
                      ? 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'
                      : 'choose Date'),
                  TextButton.icon(
                    style:
                        TextButton.styleFrom(foregroundColor: Colors.redAccent),
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.date_range),
                    label: const Text(
                      ' Choose Date',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  transactionData.addTransaction(
                      titleController, amountController, _selectedDate);

                  transactionData.clearController();

                  setState(() {
                    _selected = false;
                  });

                  Navigator.of(context).pop();
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;

          _selected = true;
        });
      }
    });
  }
}
