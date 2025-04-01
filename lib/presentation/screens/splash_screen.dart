

import 'package:flutter/material.dart';
import 'package:rto_app/core/theme/colors.dart';
import 'package:rto_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())

      );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(backgroundColor: AppColors.primary,
    body: Center(child: Image.asset('assets/images/rtoAppIcon.png'),));

  }

}
