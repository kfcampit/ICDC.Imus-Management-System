import 'package:flutter/material.dart';
import 'package:icdc_android_app/search-patients.dart';
import 'package:icdc_android_app/resources/global_variables.dart';

class SearchPatients extends StatefulWidget{
  const SearchPatients({Key? key}) : super(key: key);

  @override
 SearchPatientsPage createState() => SearchPatientsPage();
}

class SearchPatientsPage extends State<SearchPatients>{
  @override
  void initState(){
    super.initState();
  }
  
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
                const Text("Search Patients",
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              inputSearch(context),
              // myAppointments(context)
            ],
          ),
        ));
  }
}

Widget inputSearch(BuildContext context){
  return Row(
    
  );
}

