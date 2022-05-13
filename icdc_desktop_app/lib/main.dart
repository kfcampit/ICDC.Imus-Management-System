import 'package:flutter/material.dart';

void main() {
  runApp(const ICDCDesktop());
}

class ICDCDesktop extends StatelessWidget {
  const ICDCDesktop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: const Color(0xff4b39ef),
        ),
        home: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [sideBar, homePage],
          ),
        ));
  }
}

Widget sideBar = Container(
  width: 72,
  height: 100,
  child: Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Image.asset('assets/logo_1.png')),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 32, 4, 0),
            child: IconButton(
              icon: const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Home icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.person_add,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Add Patient icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Search icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.access_time,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Recent Patients icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.inbox_sharp,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Inventory icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.access_time,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Settings icon pressed...");
              },
            )),
        Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 32,
              ),
              iconSize: 32,
              onPressed: () {
                print("Home icon pressed...");
              },
            )),
      ],
    ),
  ),
  decoration: const BoxDecoration(color: Color(0xff4b39ef)),
);

Widget homePage = Expanded(
    child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
    Image.asset(
      'assets/logo_large.png',
      width: 320,
      height: 320,
    ),
    const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Text('Immaculate Concepcion Dental Clinic - Imus',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Color(0xff4b39ef))),
    ),
    const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Text(
        'Patient Record and Inventory Management System',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff4b39ef)),
      ),
    ),
    const Divider(
      thickness: 2,
      indent: 200,
      endIndent: 200,
      color: Color(0xff4b39ef),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
              height: 48,
              width: 200,
              color: const Color(0xff4b39ef),
              child: TextButton(
                child: const Text("Add Patient",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white)),
                onPressed: () {
                  print("Add Patient button pressed...");
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
              height: 48,
              width: 200,
              color: const Color(0xff4b39ef),
              child: TextButton(
                child: const Text("Search Records",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white)),
                onPressed: () {
                  print("Search Records button pressed...");
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
              height: 48,
              width: 200,
              color: const Color(0xff4b39ef),
              child: TextButton(
                child: const Text("Recent Patients",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white)),
                onPressed: () {
                  print("Recent Patients button pressed...");
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Container(
              height: 48,
              width: 200,
              color: const Color(0xff4b39ef),
              child: TextButton(
                child: const Text("Check Inventory",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white)),
                onPressed: () {
                  print("Check Inventory button pressed...");
                },
              ),
            ),
          ),
        ],
      ),
    )
  ],
));
