import 'package:flutter/material.dart';
import 'package:icdc_android_app/resources/patient_object.dart';
import 'package:icdc_android_app/search-patients.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/custom-widgets.dart';

var dropdownValue;
var viewPatientNum = 0;
var viewPatient = PatientObject();
class PatientViewPage extends StatefulWidget {
  const PatientViewPage({Key? key}) : super(key: key);

  @override
  PatientView createState() => PatientView();
}

class PatientView extends State<PatientViewPage> {
  @override
  void initState() {
    super.initState();
    viewPatient = sortedPatients[viewPatientNum];
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
                const Text("Patient Information",
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
            // searchPatientPageWidgets(context, searchBar);
        ],
      ),
    ));
  }
  }