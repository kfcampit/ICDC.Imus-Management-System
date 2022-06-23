// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/patient-view.dart';
import 'package:icdc_desktop_app/resources/algorithms.dart';
import 'package:icdc_desktop_app/resources/csv_controller.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/firebase_controller.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'dart:collection';
import '/global_variables.dart';

var dropdownValue;
int pageNum = 0;
bool isSearching = false;

class SearchPatientPage extends StatefulWidget {
  const SearchPatientPage({Key? key}) : super(key: key);

  @override
  SearchPatient createState() => SearchPatient();
}

class SearchPatient extends State<SearchPatientPage> {
  @override
  void initState() {
    super.initState();

    dropdownValue = "  Name";

    if (!isSearching && pageNum == 0) {
      searchedPatients = sortPatients();
    }
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
              searchPatientPageWidgets(context, searchBar)
            ],
          ),
        ));
  }

  Widget searchBar() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                      child: TextFormField(
                          controller: searchController,
                          autofocus: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4b39ef),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4b39ef),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff4b39ef)),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: const Color(0xff4b39ef),
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      alignment: Alignment.center,
                      isExpanded: true,
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: <String>['  Name', '  Treatment', '  Date']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                child: roundedButtons(
                  textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  height: 50,
                  width: 130,
                  color: const Color(0xff4b39ef),
                  text: "Search",
                  navFunction: navigate,
                  context: context,
                  page: const SearchPatientPage(),
                  function: searchPatientsButton,
                ),
              )
            ]));
  }
}

Widget searchPatientPageWidgets(BuildContext context, Function function) {
  return Expanded(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 32),
            child: Text('Search Patients',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff4b39ef))),
          ),
          function(),
          Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        searchContents(context),
                        const Divider(
                            thickness: 1,
                            indent: 8,
                            endIndent: 8,
                            color: Color(0xff4b39ef)),
                        patientRows(context),
                      ]))),
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
                    color: const Color(0xff4b39ef),
                    text: "Back",
                    navFunction: navigate,
                    context: context,
                    page: const SearchPatientPage(),
                    function: prevPage,
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 16),
                    child: Text(
                      "Page " +
                          (pageNum + 1).toString() +
                          " / " +
                          (searchedPatients.length / patientsPerPage)
                              .ceil()
                              .toString(),
                    )),
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
                      text: "Next",
                      function: nextPage,
                      context: context,
                      page: const SearchPatientPage(),
                      navFunction: navigate),
                ),
              ],
            ),
          ),
        ]),
  );
}

Widget searchContents(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Expanded(
          flex: 2,
          child: Text('Patient Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff4b39ef))),
        ),
        Expanded(
          flex: 3,
          child: Text('Most Recent Treatment',
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
          child: Text('View',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff4b39ef))),
        ),
      ],
    ),
  );
}

Future<void> searchPatientsButton() async {
  if (dropdownValue == '  Name') {
    searchedPatients = searchPatientsName(searchController.text);
  } else if (dropdownValue == '  Treatment') {
    searchedPatients = searchPatientsTreatment(searchController.text);
  } else if (dropdownValue == '  Date') {
    searchedPatients = searchPatientsDate(int.parse(searchController.text));
  }
  isSearching = true;
  pageNum = 0;
}

Widget patientRows(BuildContext context) {
  List<Widget> widgetList = [];
  int n = searchedPatients.length;

  for (int i = (pageNum * patientsPerPage);
      i < pageNum * patientsPerPage + patientsPerPage;
      i++) {
    if (i < n) {
      widgetList.add(listPatientsSearch(i, context));
    }
  }

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

Widget listPatientsSearch(int i, BuildContext context) {
  if (searchedPatients[i].dentalRecords.isEmpty) {
    DentalRecord ph = DentalRecord();
    ph.transDate = 0;
    searchedPatients[i].dentalRecords.add(ph);
  }

  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              child: Text(
                searchedPatients[i].name.toString(),
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
                searchedPatients[i].dentalRecords[0].description.toString(),
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
                unixToString(searchedPatients[i].dentalRecords.first.transDate),
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
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: roundedButtons(
                  textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white),
                  height: 30,
                  width: 110,
                  color: const Color(0xff4b39ef),
                  text: "View",
                  function: () {
                    viewPatientNum = i;
                  },
                  navFunction: navigate,
                  context: context,
                  page: const PatientViewPage(),
                ))),
      ],
    ),
  );
}

void nextPage() {
  if (((pageNum + 1) * patientsPerPage) < searchedPatients.length) pageNum++;
}

void prevPage() {
  if (pageNum != 0) pageNum--;
}
