import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/firebase_controller.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'package:icdc_desktop_app/search-patients.dart';
import 'dart:core';
import '/global_variables.dart';

var viewPatientNum = 0;
PatientObject viewPatient = PatientObject();
bool fromSearch = true;

class PatientViewPage extends StatefulWidget {
  const PatientViewPage({Key? key}) : super(key: key);

  @override
  PatientView createState() => PatientView();
}

class PatientView extends State<PatientViewPage> {
  @override
  void initState() {
    super.initState();
    viewPatient = searchedPatients[viewPatientNum];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff4b39ef),
        ),
        home: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sidebarWidget(context),
              patientEntryPageWidgets(context)
            ],
          ),
        ));
  }
}

Widget patientEntryPageWidgets(BuildContext context) {
  return Expanded(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
            child: Text('View Patient Information',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff4b39ef))),
          ),
          patientInfo(context, viewPatientNum),
        ]),
  );
}

Widget patientInfo(BuildContext context, int i) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                    child: Text(viewPatient.name.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Text(viewPatient.bday.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Text(viewPatient.marital.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                    )),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: Text(viewPatient.sex.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(viewPatient.contact.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                ),
              ),
            ]),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          24,
          8,
          16,
          0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(viewPatient.address.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
      treatmentsWidget(context),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: roundedButtons(
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
                height: 40,
                width: 130,
                color: Color(0xFF4B39EF),
                text: "Back",
                navFunction: navigate,
                context: context,
                page: const ICDCDesktop(),
                function: placeholder,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: roundedButtons(
                  textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  height: 40,
                  width: 130,
                  color: const Color(0xff4b39ef),
                  text: "Edit",
                  function: enterPatientInfo,
                  context: context,
                  page: const PatientEntryPage(),
                  navFunction: navigate),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget treatmentsWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: const Color(0xFFEEEEEE),
      ),
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Expanded(
                            flex: 1,
                            child: Text('Tooth Number',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('Surface',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Description of Services',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('Date',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('Fee',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        thickness: 1,
                        indent: 8,
                        endIndent: 8,
                        color: Color(0xff4b39ef)),
                    treatmentRows(context),
                  ]))),
    ),
  );
}

Widget treatmentRows(BuildContext context) {
  List<Widget> widgetList = [];
  int n = viewPatient.dentalRecords.length;

  for (int i = 0; i < n; i++) {
    widgetList.add(listTreatments(i));
  }

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

Widget listTreatments(int n) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              child: Text(
                viewPatient.dentalRecords[n].toothNum.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                viewPatient.dentalRecords[n].surface.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                viewPatient.dentalRecords[n].description.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                viewPatient.dentalRecords[n].transDate.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
              child: Text(
                viewPatient.dentalRecords[n].fee.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
      ],
    ),
  );
}

void addTreatmentButton() {
  DentalRecord dental = DentalRecord();

  dental.toothNum = toothNumController.text;
  dental.surface = surfaceController.text;
  dental.description = serviceController.text;
  dental.transDate = int.parse(dateController.text);
  dental.fee = int.parse(feeController.text);
  patient.dentalRecords.add(dental);

  toothNumController.clear();
  surfaceController.clear();
  serviceController.clear();
  dateController.clear();
  feeController.clear();
}

void removeTreatmentButton() {
  print("REMOVE TREATMENT");
}

void enterPatientInfo() {
  isEditPatient = true;
  viewPatient = searchedPatients[viewPatientNum];
}
