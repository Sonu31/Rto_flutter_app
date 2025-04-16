import 'package:flutter/material.dart';

class CelebraityCarList extends StatefulWidget{
  @override
  @override
  _CelebraityCarList createState() => _CelebraityCarList();
}

class _CelebraityCarList extends State<CelebraityCarList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Celebrity Cars'),leading: IconButton(onPressed: (){

        Navigator.pop(context); // Navigate back

    }, icon: Icon(Icons.arrow_back, size: 30, color: Colors.greenAccent))));
  }

}
