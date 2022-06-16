import 'package:flutter/material.dart';
import 'package:icdc_android_app/open-appointments.dart';
import 'package:icdc_android_app/search-patients.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'resources/custom-widgets.dart';

void main() {
  firstTimeRun = true;
  runApp(const ICDCAndroid());
}

class ICDCAndroid extends StatelessWidget {
  const ICDCAndroid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // primaryColor: const Color(0xff4b39ef)
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff4b39ef),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Home",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: 
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo_1.png',
                        width: 40,
                        height: 40,
                        ),
                      const Text("ICDC - IMUS",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),),
                    ],
                  ))
                ]
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff4b39ef),
            toolbarHeight: 80.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_large.png',
                width: 150,
                height: 150,
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 10),
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
                child: 
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Patient Record and Inventory Management System',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff4b39ef)),
                    ),
                  ),
              ),
              const Divider(
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: Color(0xff4b39ef),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedButtons(
                      height: 80, 
                      width: 200,
                      bottom: 10,
                      color: const Color(0xff4b39ef), 
                      text: "Search Records", 
                      function: placeholder, 
                      navFunction: navigate,
                      context: context,
                      page: const SearchPatients(),
                    ),
                    roundedButtons(
                      height: 80, 
                      width: 200, 
                      bottom: 10,
                      color: const Color(0xff4b39ef), 
                      text: "Appointments", 
                      function: placeholder, 
                      navFunction: navigate,
                      context: context,
                      page: const OpenAppointments(),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ));
  }
}



void navigate(BuildContext context, Widget object) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => object));
}
// floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: ((context) => SearchPatients())));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),

