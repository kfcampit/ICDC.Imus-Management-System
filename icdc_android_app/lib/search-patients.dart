import 'package:flutter/material.dart';
import 'package:icdc_android_app/patient-view.dart';
import 'package:icdc_android_app/resources/firebase_controller.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/custom-widgets.dart';
import 'package:icdc_android_app/resources/algorithms.dart';

import 'main.dart';

var dropdownValue;
int pageNum = 0;

class SearchPatients extends StatefulWidget {
  const SearchPatients({Key? key}) : super(key: key);

  @override
  SearchPatientsPage createState() => SearchPatientsPage();
}

class SearchPatientsPage extends State<SearchPatients> {
  @override
  void initState() {
    super.initState();
    dropdownValue = "  Name";
    print("test");
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
                  const Text(
                    "Search Records",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/logo_1.png',
                            width: 40,
                            height: 40,
                          ),
                          const Text(
                            "ICDC - IMUS",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ))
                ]),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff4b39ef),
            toolbarHeight: 80.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [searchPatientPageWidgets(context, searchBar)],
          ),
        ));
  }

  Widget searchBar() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                      child: TextFormField(
                          controller: nameController,
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
                    width: 98,
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
                  child: iconButton(
                      iconName: Icons.search_sharp,
                      function: placeholder,
                      size: 20,
                      iconSize: 28,
                      navFunction: navPlaceholder))
            ]));
  }
}

Widget searchPatientPageWidgets(BuildContext context, Function function) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
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
                  ])
              )
            ),
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
                    height: 50,
                    width: 80,
                    color: const Color(0xff4b39ef),
                    text: "Back",
                    navFunction: navigate,
                    context: context,
                    page: const SearchPatients(),
                    function: prevPage,
                  ),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 16),
                    child: Text(
                      "Page " +
                          (pageNum + 1).toString() +
                          " / " +
                          (listPatients.length / 8).ceil().toString(),
                    )),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: roundedButtons(
                      textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white),
                      height: 50,
                      width: 80,
                      color: const Color(0xff4b39ef),
                      text: "Next",
                      function: nextPage,
                      context: context,
                      page: const SearchPatients(),
                      navFunction: navigate),
                ),
              ],
            ),
          ),
        ]),
    ), 
    
  );
}

Widget patientRows(BuildContext context) {
  List<Widget> widgetList = [];
  int n = getNumPatients();
  sortedPatients = sortPatients();

  for (int i = (pageNum * 8); i < pageNum * 8 + 8; i++) {
    if (i < n) {
      widgetList.add(listPatientsSearch(i, context));
    }
  }

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

void nextPage() {
  if ((pageNum * 8) < listPatients.length / 8) pageNum++;
}

void prevPage() {
  if (pageNum != 0) pageNum--;
}

void viewPatient(int i) {
  viewPatientNum = i;
}

Widget listPatientsSearch(int i, BuildContext context) {
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
                sortedPatients[i].name.toString(),
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
                sortedPatients[i].dentalRecords[0].description.toString(),
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
                sortedPatients[i].dentalRecords.last.transDate.toString(),
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
                    viewPatient(i);
                  },
                  navFunction: navigate,
                  context: context,
                  page: const PatientViewPage(),
                ))),
      ],
    ),
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
          child:Text('View',
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