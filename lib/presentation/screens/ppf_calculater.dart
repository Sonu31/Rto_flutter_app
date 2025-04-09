



import 'dart:math';

import 'package:flutter/material.dart';

class PPFCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPF Calculator',
      home: PPFCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PPFCalculatorScreen extends StatefulWidget {
  @override
  _PPFCalculatorScreenState createState() => _PPFCalculatorScreenState();
}

class _PPFCalculatorScreenState extends State<PPFCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController investmentController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();

  double interestRate = 7.1; // Default interest rate
  double maturityAmount = 0;
  double totalInvested = 0;
  double totalInterest = 0;

  void calculatePPF() {
    double P = double.tryParse(investmentController.text) ?? 0;
    int t = int.tryParse(yearsController.text) ?? 0;
    double r = interestRate / 100;

    double A = 0;

    for (int i = 0; i < t; i++) {
      A += P * pow((1 + r), (t - i));
    }

    setState(() {
      maturityAmount = A;
      totalInvested = P * t;
      totalInterest = maturityAmount - totalInvested;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PPF Calculator"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Public Provident Fund (PPF) Calculator",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                SizedBox(height: 20),

                TextFormField(
                  controller: investmentController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Yearly Investment (₹)',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                TextFormField(
                  controller: yearsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Duration (Years)',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  children: [
                    Text("Interest Rate: ${interestRate.toStringAsFixed(1)}%"),
                    Spacer(),
                    Slider(
                      value: interestRate,
                      min: 6.0,
                      max: 8.0,
                      divisions: 20,
                      label: "${interestRate.toStringAsFixed(1)}%",
                      onChanged: (value) {
                        setState(() {
                          interestRate = value;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: calculatePPF,
                  child: Text("Calculate"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),

                SizedBox(height: 30),

                if (maturityAmount > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Results", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      resultRow("Total Invested:", "₹ ${totalInvested.toStringAsFixed(2)}"),
                      resultRow("Total Interest:", "₹ ${totalInterest.toStringAsFixed(2)}"),
                      resultRow("Maturity Amount:", "₹ ${maturityAmount.toStringAsFixed(2)}"),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget resultRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}