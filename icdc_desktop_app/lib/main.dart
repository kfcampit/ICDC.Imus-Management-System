import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/check-inventory.dart';
import 'package:icdc_desktop_app/patient-view.dart';
import 'package:icdc_desktop_app/recent-patients.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/resources/firebase_controller.dart';
import 'package:icdc_desktop_app/global_variables.dart';
import 'package:icdc_desktop_app/search-patients.dart';
import 'package:icdc_desktop_app/settings.dart';

import 'resources/csv_controller.dart';

const apiKey = "AIzaSyBHcnxX4cPlcl1vgivb8G7p4jvXn0U9fYc";
const projectId = 'icdc-imus-cms';

Future<void> main() async {
  Firestore.initialize(projectId);
  await loadPatients();
  await readInventoryData();
  await readSettings();
  runApp(const ICDCDesktop());
}

class ICDCDesktop extends StatelessWidget {
  const ICDCDesktop({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clinic Management System',
        theme: ThemeData(
          primaryColor: mainColor,
        ),
        home: Builder(
            builder: (context) => Scaffold(
                  body: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [sidebarWidget(context), homePageWidget(context)],
                  ),
                )));
  }
}

Widget homePageWidget(BuildContext context) {
  return Expanded(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Image.asset(
        'assets/logo_large.png',
        width: 320,
        height: 320,
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Text('Immaculate Concepcion Dental Clinic - Imus',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: mainColor)),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: Text(
          'Patient Record and Inventory Management System',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: mainColor),
        ),
      ),
      Divider(
        thickness: 2,
        indent: 200,
        endIndent: 200,
        color: mainColor,
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            roundedButtons(
                height: 48,
                width: 200,
                color: mainColor,
                text: "Add Patient",
                start: 8,
                top: 8,
                end: 8,
                bottom: 8,
                navFunction: navigate,
                function: placeholder,
                context: context,
                page: const PatientEntryPage()),
            roundedButtons(
                height: 48,
                width: 200,
                color: mainColor,
                text: "Search Records",
                navFunction: navigate,
                function: placeholder,
                context: context,
                page: const SearchPatientPage(),
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
            roundedButtons(
                height: 48,
                width: 200,
                color: mainColor,
                text: "Recent Patients",
                navFunction: navigate,
                function: placeholder,
                context: context,
                page: const RecentPatientsPage(),
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
            roundedButtons(
                height: 48,
                width: 200,
                color: mainColor,
                text: "Check Inventory",
                navFunction: navigate,
                function: placeholder,
                context: context,
                page: const CheckInventory(),
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
          ],
        ),
      )
    ],
  ));
}

Widget sidebarWidget(BuildContext context) {
  return Container(
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
              padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 28),
              child: Image.asset('assets/logo_1.png')),
          sideBarButtonIcon(
              iconName: Icons.home_filled,
              function: navigate,
              context: context,
              page: const ICDCDesktop()),
          sideBarButtonIcon(
              iconName: Icons.person_add,
              function: navigate,
              context: context,
              page: const PatientEntryPage()),
          sideBarButtonIcon(
              iconName: Icons.search_sharp,
              function: navigate,
              context: context,
              page: const SearchPatientPage()),
          sideBarButtonIcon(
              iconName: Icons.access_time,
              function: navigate,
              context: context,
              page: const RecentPatientsPage()),
          sideBarButtonIcon(
              iconName: Icons.inbox_sharp,
              function: navigate,
              context: context,
              page: const CheckInventory()),
          sideBarButtonIcon(
              iconName: Icons.settings,
              function: navigate,
              context: context,
              page: const SettingsPage()),
        ],
      ),
    ),
    decoration: BoxDecoration(color: mainColor),
  );
}

Future<void> navigate(BuildContext context, Widget object) async {
  if (object == const PatientEntryPage()) {
    isEditPatient = false;
  }

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => object));
}
