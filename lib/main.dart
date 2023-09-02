import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelCalculator(),
    );
  }
}

class FuelCalculator extends StatefulWidget {
  @override
  _FuelCalculatorState createState() => _FuelCalculatorState();
}

class _FuelCalculatorState extends State<FuelCalculator> {
  TextEditingController alcoholController = TextEditingController();
  TextEditingController gasolineController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: alcoholController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço do Álcool'),
            ),
            TextField(
              controller: gasolineController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço da Gasolina'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateFuel();
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                clearFields();
              },
              child: Text('Limpar'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateFuel() {
    if (alcoholController.text.isEmpty || gasolineController.text.isEmpty) {
      setState(() {
        result = 'Preencha ambos os campos corretamente.';
      });
      return;
    }

    double alcoholPrice = double.parse(alcoholController.text);
    double gasolinePrice = double.parse(gasolineController.text);

    double ratio = alcoholPrice / gasolinePrice;

    setState(() {
      if (ratio < 0.7) {
        result = 'Abasteça com Álcool';
      } else {
        result = 'Abasteça com Gasolina';
      }
    });
  }

  void clearFields() {
    setState(() {
      alcoholController.text = '';
      gasolineController.text = '';
      result = '';
    });
  }
}
