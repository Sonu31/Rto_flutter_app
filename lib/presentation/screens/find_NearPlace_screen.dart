
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rto_app/core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FindNearPlace extends StatefulWidget{
  const FindNearPlace({super.key});
  @override
  _FindNearPlace createState() => _FindNearPlace();
}

class _FindNearPlace extends State<FindNearPlace> {
  String buttonText = "Click Me";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Find Near Place"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context); // Navigate back
        },),),
      body: Container(
        margin: EdgeInsets.only(left: 6),
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 5),child:
          Text("Near By Places",style: TextStyle(fontSize: 20),),),
          Container( margin: EdgeInsets.only(top: 7),

            child:  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

              Material(color:  Colors.transparent,child:    InkWell(onTap: () async {
                final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=petrol+pump";
                final Uri uri = Uri.parse(googleMapsUrl);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  if (kDebugMode) {
                    print("Could not launch Google Maps");
                  }
                }

              },
                child:Column(children: [Icon(Icons.home,size: 30,) ,Text("Petrol Pum") ],),
              ),),

              Material(color:  Colors.transparent,child:    InkWell(onTap: (){
              },
                child:  Column(children: [Icon(Icons.home,size: 30,) ,Text("Charging Station") ],),
              ),),
              Material(color:  Colors.transparent,child:    InkWell(onTap: (){
              },
                child:  Column(children: [Icon(Icons.home,size: 30,) ,Text("Car Wash") ],),
              ),),
              Material(color:  Colors.transparent,child:    InkWell(onTap: (){
              },
                child:     Column(children: [Icon(Icons.home,size: 30,) ,Text("RTO Office") ],)
              ),),


            ],)
            ,
            )


      ],) ,),



    );
  }
}
