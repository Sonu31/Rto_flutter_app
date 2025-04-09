
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




 class AgeCalculatorApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Age Calculator',
       debugShowCheckedModeBanner: false,
       theme: ThemeData(primarySwatch: Colors.deepPurple),
       home: AgeCalculatorScreen(),
     );
   }
 }

 class AgeCalculatorScreen extends StatefulWidget {
   @override
   _AgeCalculatorScreenState createState() => _AgeCalculatorScreenState();
 }

 class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
   DateTime? selectedDate;
   String ageResult = '';
   String nextBirthdayResult = '';

   void pickDate() async {
     final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: DateTime(2000),
       firstDate: DateTime(1900),
       lastDate: DateTime.now(),
     );

     if (picked != null) {
       setState(() {
         selectedDate = picked;
         calculateAge(picked);
       });
     }
   }

   void calculateAge(DateTime dob) {
     DateTime today = DateTime.now();

     int years = today.year - dob.year;
     int months = today.month - dob.month;
     int days = today.day - dob.day;

     if (days < 0) {
       months -= 1;
       days += DateTime(today.year, today.month, 0).day;
     }

     if (months < 0) {
       years -= 1;
       months += 12;
     }

     setState(() {
       ageResult = '$years Years, $months Months, $days Days';

       // Next birthday
       DateTime nextBirthday = DateTime(today.year, dob.month, dob.day);
       if (nextBirthday.isBefore(today)) {
         nextBirthday = DateTime(today.year + 1, dob.month, dob.day);
       }
       Duration diff = nextBirthday.difference(today);
       nextBirthdayResult = '${diff.inDays} days remaining for your next Birthday!';
     });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Age Calculator"),
       ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           children: [
             SizedBox(height: 20),
             Text(
               "Select Your Date of Birth",
               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
             ),
             SizedBox(height: 20),
             ElevatedButton.icon(
               icon: Icon(Icons.cake_outlined),
               label: Text("Pick Date of Birth"),
               onPressed: pickDate,
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
                   resultCard("Date of Birth:", DateFormat('dd MMM yyyy').format(selectedDate!)),
                   resultCard("Your Age:", ageResult),
                   resultCard("Next Birthday:", nextBirthdayResult),
                 ],
               ),
           ],
         ),
       ),
     );
   }

   Widget resultCard(String title, String value) {
     return Card(
       color: Colors.deepPurple.shade50,
       margin: EdgeInsets.symmetric(vertical: 10),
       child: ListTile(
         leading: Icon(Icons.star_border, color: Colors.deepPurple),
         title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
         subtitle: Text(value, style: TextStyle(fontSize: 16)),
       ),
     );
   }
 }
