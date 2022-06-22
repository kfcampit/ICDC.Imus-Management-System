import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/resources/algorithms.dart';
import 'package:icdc_desktop_app/resources/csv_controller.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/firebase_controller.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'package:icdc_desktop_app/search-patients.dart';
import 'dart:core';
import '/global_variables.dart';

var viewPatientNum = 0;
PatientObject viewPatient = PatientObject();
bool fromSearch = true;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Settings createState() => Settings();
}

class Settings extends State<SettingsPage> {
  @override
  void initState() {
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
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [sidebarWidget(context), settingsPageWidgets(context)],
          ),
        ));
  }
}

Widget settingsPageWidgets(BuildContext context) {
  return Expanded(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
            child: Text('Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff4b39ef))),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Patients per page:",
                    textAlign: TextAlign.left, style: settingsTextStyle()),
                Container(
                    width: 100,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: numRowsPerPage,
                        cursorHeight: 24,
                        decoration: InputDecoration(
                          hintText: patientsPerPage.toString(),
                          border: const UnderlineInputBorder(),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    )),
                roundedButtons(
                    height: 40,
                    width: 100,
                    color: const Color(0xff4b39ef),
                    text: "Save",
                    function: setPatientsPerRow,
                    navFunction: navigate,
                    context: context,
                    page: const SettingsPage(),
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white))
              ],
            ),
          )
        ]),
  );
}

TextStyle settingsTextStyle() {
  return const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 24,
      color: Color(0xff4b39ef));
}

void setPatientsPerRow() {
  patientsPerPage = int.parse(numRowsPerPage.text);
  saveSettings();
}
