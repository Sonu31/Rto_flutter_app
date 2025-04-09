import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SipCalculatorScreen2 extends StatefulWidget {
  const SipCalculatorScreen2({super.key});

  @override
  State<SipCalculatorScreen2> createState() => _SipCalculatorScreenState();
}

class _SipCalculatorScreenState extends State<SipCalculatorScreen2> {
  double monthlyInvestment = 5000;
  double returnRate = 12;
  double timePeriod = 10;

  double get investedAmount => monthlyInvestment * 12 * timePeriod;

  double get totalValue {
    double r = returnRate / (12 * 100);
    double n = timePeriod * 12;
    double futureValue = monthlyInvestment * (((pow((1 + r), n)) - 1) / r) * (1 + r);
    return futureValue;
  }

  double get returns => totalValue - investedAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIP Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGauge(),
              const SizedBox(height: 30),
              _buildSlider("Monthly Investment", monthlyInvestment, 500, 100000, (value) {
                setState(() => monthlyInvestment = value);
              }),
              _buildSlider("Expected Return Rate (%)", returnRate, 1, 30, (value) {
                setState(() => returnRate = value);
              }),
              _buildSlider("Investment Duration (Years)", timePeriod, 1, 40, (value) {
                setState(() => timePeriod = value);
              }),
              const SizedBox(height: 20),
              _buildResult("Invested Amount", investedAmount),
              _buildResult("Estimated Returns", returns),
              _buildResult("Total Value", totalValue),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: const Text("INVEST NOW", style: TextStyle(fontSize: 16, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGauge() {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: totalValue,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(thickness: 0.15, thicknessUnit: GaugeSizeUnit.factor),
          pointers: <GaugePointer>[
            RangePointer(
              value: investedAmount,
              color: Colors.blue.shade300,
              width: 0.15,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            RangePointer(
              value: totalValue,
              color: Colors.green.shade400,
              width: 0.15,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Total Value", style: TextStyle(fontSize: 14)),
                  Text("₹${totalValue.toStringAsFixed(0)}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label: ₹${value.toStringAsFixed(0)}", style: const TextStyle(fontSize: 16)),
        SfSlider(
          min: min,
          max: max,
          value: value,
          interval: (max - min) / 5,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          onChanged: (value) => onChanged(value as double),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildResult(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text("₹${value.toStringAsFixed(0)}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
