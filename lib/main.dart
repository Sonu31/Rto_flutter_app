import 'package:flutter/material.dart';
import 'package:rto_app/presentation/screens/splash_screen.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title:'RTO App',debugShowCheckedModeBanner: false,home: SplashScreen(),);
  }
}

