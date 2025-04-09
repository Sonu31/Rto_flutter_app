import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class VehicleAgeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Age Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: VehicleAgeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VehicleAgeScreen extends StatefulWidget {
  @override
  _VehicleAgeScreenState createState() => _VehicleAgeScreenState();
}

class _VehicleAgeScreenState extends State<VehicleAgeScreen> {
  DateTime? selectedDate;
  String vehicleAge = '';
  String vehicleStatus = '';

  void pickRegistrationDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2015),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        calculateVehicleAge(picked);
      });
    }
  }

  void calculateVehicleAge(DateTime regDate) {
    DateTime today = DateTime.now();

    int years = today.year - regDate.year;
    int months = today.month - regDate.month;
    int days = today.day - regDate.day;

    if (days < 0) {
      months--;
      days += DateTime(today.year, today.month, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    setState(() {
      vehicleAge = "$years Years, $months Months, $days Days";
      vehicleStatus = (years >= 15)
          ? "⚠️ Vehicle may need re-registration (15+ years)"
          : "✅ Vehicle is under normal usage age";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Age Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Select Vehicle Registration Date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: pickRegistrationDate,
              icon: Icon(Icons.directions_car),
              label: Text("Pick Registration Date"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
            ),
            SizedBox(height: 30),
            if (selectedDate != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  resultCard("Registration Date", DateFormat('dd MMM yyyy').format(selectedDate!)),
                  resultCard("Vehicle Age", vehicleAge),
                  resultCard("Status", vehicleStatus),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget resultCard(String title, String value) {
    return Card(
      color: Colors.indigo.shade50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(Icons.info_outline, color: Colors.indigo),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
