import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rto_app/presentation/screens/find_NearPlace_screen.dart';
import 'package:rto_app/presentation/screens/ppf_calculater.dart';
import 'package:rto_app/presentation/screens/sip_calculater2.dart';
import 'package:rto_app/presentation/screens/sip_calculter_screen.dart';
import 'package:rto_app/presentation/screens/speedMeter_screen.dart';
import 'package:rto_app/presentation/screens/vechicleAge_calculater.dart';

import '../../core/theme/colors.dart';
import 'age_calculter_screen.dart';
import 'celebrity_cars/CelebrityCarsList.dart';
import 'fule_calculater.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("RTO App"),
        leading: IconButton(
          icon: Icon(Icons.menu, size: 30, color: Colors.greenAccent),
          onPressed: () {
            {
              _scaffoldKey.currentState?.openDrawer(); // Manually open drawer
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                    radius: 30,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sonu Kumar",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "sonuhjpkumar@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("RTO Details", style: TextStyle(fontSize: 20)),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [Icon(Icons.home, size: 40), Text("ABC")],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("Vahan Services"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("RTO info"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("RTO  Exam"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("Informatory"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.home, size: 40),
                            Text("Cautionary"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("Mandatory"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("Signals"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("Ecallan"),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.rtt_outlined, size: 40),
                            Text("ABC"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Other", style: TextStyle(fontSize: 20)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgeCalculatorApp(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock, size: 30),
                          Text("Age Cal"),
                        ],
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PPFCalculatorApp(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock, size: 30),
                          Text("PPF Cal"),
                        ],
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SipCalculatorScreen2(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock, size: 30),
                          Text("Sip Cal"),
                        ],
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FuelCalculatorApp(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock, size: 30),
                          Text("Fuel Cal"),
                        ],
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgeCalculatorApp(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock, size: 30),
                          Text("EMI Cal"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Celebrity Cars", style: TextStyle(fontSize: 20)),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Enables horizontal scrolling
                child: Row(
                  children: List.generate(
                    10,
                    (index) =>InkWell(
                          onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => CelebraityCarList(),),);
                            showToast(index);
                          },
                      child:   Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(13)),
                      margin: EdgeInsets.all(4),
                      child: Center(child: Text("Item $index",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
              ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(" Other", style: TextStyle(fontSize: 20)),
              ),

              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpeedMeterScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 70,
                          width: 100,
                          color: Colors.white,
                          child: Center(child: Text("Speedometer")),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: 100,
                          color: Colors.white,
                          child: Center(child: Text("Offline Map")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {

                            Navigator.push(context,MaterialPageRoute(builder: (context) => VehicleAgeApp(),),);

                        },
                        child: Container(
                          height: 70,
                          width: 100,
                          color: Colors.white,
                          child: Center(child: Text("Vehicle Age")),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: 100,
                          color: Colors.white,
                          child: Center(child: Text("Expence Manager")),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindNearPlace()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 14),
                  alignment: Alignment.center,
                  child: Container(
                    height: 80,
                    width: 300,
                    color: Colors.tealAccent,
                    alignment: Alignment.center,
                    child: Text(
                      "Find Place Near By me",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      color: Colors.yellow,
                      child: Center(child: Text("VIP Number")),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      color: Colors.yellow,
                      child: Center(child: Text("PerMit Details")),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      width: 100,
                      color: Colors.yellow,
                      child: Center(child: Text("Analytics")),
                    ),
                    Container(
                      height: 70,
                      width: 100,
                      color: Colors.yellow,
                      child: Center(child: Text("Check Fastag")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void showToast(int index) {
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.black87,
        ),
        child: Text("Clicked on Item $index", style: TextStyle(color: Colors.white)),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
