import 'package:flutter/material.dart';
import 'package:icdc_android_app/patient-view.dart';
import 'package:icdc_android_app/resources/firebase_controller.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/custom-widgets.dart';
import 'package:icdc_android_app/resources/algorithms.dart';

import 'main.dart';

var dropdownValue;
int pageNum = 0;
bool isSearching = false;

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

    if (!isSearching) {
      searchedPatients = sortPatients();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: mainColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                searchController.clear();
                isSearching = false;
                navigate(
                    context, const MyHomePage(title: 'Flutter Demo Home Page'));
              },
              child: const Icon(Icons.arrow_back),
            ),
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
                        ],
                      ))
                ]),
            foregroundColor: Colors.white,
            backgroundColor: mainColor,
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                      child: TextFormField(
                          controller: searchController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
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
                      border: Border.all(color: mainColor),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: mainColor,
                      ),
                      elevation: 16,
                      style: TextStyle(color: mainColor),
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
                    size: 20,
                    iconSize: 28,
                    color: mainColor,
                    navFunction: navigate,
                    context: context,
                    page: const SearchPatients(),
                    function: searchPatientsButton,
                  ))
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
                          Divider(
                              thickness: 1,
                              indent: 8,
                              endIndent: 8,
                              color: mainColor),
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
                      height: 50,
                      width: 80,
                      color: mainColor,
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
                            (listPatients.length / 7).ceil().toString(),
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
                        color: mainColor,
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

void searchPatientsButton() {
  if (dropdownValue == '  Name') {
    print("Before: " + searchedPatients.length.toString());
    searchedPatients = searchPatientsName(searchController.text);
    print("After: " + searchedPatients.length.toString());
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

  for (int i = (pageNum * 7); i < pageNum * 7 + 7; i++) {
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
  if ((pageNum * 7) < listPatients.length / 7) pageNum++;
}

void prevPage() {
  if (pageNum != 0) pageNum--;
}

void viewPatient(int i) {
  viewPatientNum = i;
  patient.name = "Test Name".toString();
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
                searchedPatients[i].name.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                searchedPatients[i].dentalRecords[0].description.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                unixToString(searchedPatients[i].dentalRecords.last.transDate),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: mainColor,
                child: IconButton(
                  icon: const Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                    size: 18,
                  ),
                  iconSize: 18,
                  onPressed: () {
                    viewPatient(i);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const PatientViewPage())));
                  },
                ),
              ),
            )),
      ],
    ),
  );
}

Widget searchContents(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text('Patient Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: mainColor)),
        ),
        Expanded(
          flex: 2,
          child: Text('Most Recent Treatment',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: mainColor)),
        ),
        Expanded(
          flex: 1,
          child: Text('Date',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: mainColor)),
        ),
        Expanded(
          flex: 1,
          child: Text('View',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: mainColor)),
        ),
      ],
    ),
  );
}
