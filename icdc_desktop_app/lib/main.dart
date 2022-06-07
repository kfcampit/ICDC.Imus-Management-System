import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/check-inventory.dart';
import 'package:icdc_desktop_app/recent-patients.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/search-patients.dart';
import 'package:icdc_desktop_app/settings.dart';

import 'package:firebase_core/firebase_core.dart';
import 'resources/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          primaryColor: const Color(0xff4b39ef),
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
            roundedButtons(
                height: 48,
                width: 200,
                color: const Color(0xff4b39ef),
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
                color: const Color(0xff4b39ef),
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
                color: const Color(0xff4b39ef),
                text: "Recent Patients",
                navFunction: navigate,
                function: placeholder,
                context: context,
                page: const RecentPatients(),
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
            roundedButtons(
                height: 48,
                width: 200,
                color: const Color(0xff4b39ef),
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
              page: const RecentPatients()),
          sideBarButtonIcon(
              iconName: Icons.inbox_sharp,
              function: navigate,
              context: context,
              page: const CheckInventory()),
          sideBarButtonIcon(
              iconName: Icons.settings,
              function: navigate,
              context: context,
              page: const Settings()),
        ],
      ),
    ),
    decoration: const BoxDecoration(color: Color(0xff4b39ef)),
  );
}

void test() {
  print("Button is working...");
}

void navigate(BuildContext context, Widget object) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => object));
}
