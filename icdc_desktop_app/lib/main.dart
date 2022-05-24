import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/patient-entry.dart';

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
                function: navigate,
                context: context,
                page: const PatientEntry()),
            roundedButtons(
                height: 48,
                width: 200,
                color: const Color(0xff4b39ef),
                text: "Search Records",
                function: test,
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
            roundedButtons(
                height: 48,
                width: 200,
                color: const Color(0xff4b39ef),
                text: "Recent Patients",
                function: test,
                start: 8,
                top: 8,
                end: 8,
                bottom: 8),
            roundedButtons(
                height: 48,
                width: 200,
                color: const Color(0xff4b39ef),
                text: "Check Inventory",
                function: test,
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
              page: const PatientEntry()),
          sideBarButtonIcon(iconName: Icons.search_sharp, function: test),
          sideBarButtonIcon(iconName: Icons.access_time, function: test),
          sideBarButtonIcon(iconName: Icons.inbox_sharp, function: test),
          sideBarButtonIcon(iconName: Icons.settings, function: test),
        ],
      ),
    ),
    decoration: const BoxDecoration(color: Color(0xff4b39ef)),
  );
}

ButtonTheme roundedButtons({
  double? start,
  double? top,
  double? end,
  double? bottom,
  required double height,
  required double width,
  required Color color,
  required String text,
  TextStyle? textStyle,
  required Function function,
  BuildContext? context,
  Widget? page,
}) {
  textStyle ??= const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.white);

  start ??= 0;
  top ??= 0;
  end ??= 0;
  bottom ??= 0;

  return ButtonTheme(
    child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(start, top, end, bottom),
        child: Container(
          height: height,
          width: width,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(16)),
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: color)))),
            child: Text(text, textAlign: TextAlign.center, style: textStyle),
            onPressed: () {
              function(context, page);
            },
          ),
        )),
  );
}

ButtonTheme sideBarButtonIcon({
  required IconData iconName,
  String? hoverText,
  required Function function,
  BuildContext? context,
  Widget? page,
}) {
  return ButtonTheme(
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          child: IconButton(
            icon: Icon(
              iconName,
              color: Colors.white,
              size: 32,
            ),
            iconSize: 32,
            onPressed: () {
              function(context, page);
            },
          )));
}

void test() {
  print("Button is working...");
}

void navigate(BuildContext context, Widget object) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => object));
}
