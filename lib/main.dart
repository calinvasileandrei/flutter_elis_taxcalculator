import 'package:corso_elislutter/taxButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Elis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Elis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeTax = 22;
  double total = 0;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  void setActiveTax(int tax) {
    setState(() {
      activeTax = tax;
    });
  }

  void calculateTax() {
    setState(() {
      total = (double.parse(_amountController.text) * (activeTax / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                'Inserisci importo',
              ),
            ),
            TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'importo',
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TaxButton(
                      setActiveTax: setActiveTax,
                      activeTax: activeTax,
                      value: 22),
                  TaxButton(
                      setActiveTax: setActiveTax,
                      activeTax: activeTax,
                      value: 10),
                  TaxButton(
                      setActiveTax: setActiveTax,
                      activeTax: activeTax,
                      value: 4),
                ]),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text('Importo senza IVA ' + _amountController.text)),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text('IVA ' + (activeTax / 100).toString())),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text('totale è ' + total.toStringAsFixed(2))),
          ],
        ),
      ),
      floatingActionButton: renderCalculateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget renderCalculateButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => calculateTax(),
        child: Text('Calcola'),
      ),
    );
  }
}
