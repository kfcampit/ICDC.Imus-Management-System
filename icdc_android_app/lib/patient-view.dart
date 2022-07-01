import 'package:flutter/material.dart';
import 'package:icdc_android_app/resources/patient_object.dart';
import 'package:icdc_android_app/search-patients.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/custom-widgets.dart';
import 'package:icdc_android_app/resources/algorithms.dart';

import 'main.dart';

var dropdownValue;
var viewPatientNum = 0;
PatientObject viewPatient = PatientObject();

class PatientViewPage extends StatefulWidget {
  const PatientViewPage({Key? key}) : super(key: key);

  @override
  PatientView createState() => PatientView();
}

TextStyle body1(Color color) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: color);
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
          primaryColor: mainColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                searchController.clear();
                isSearching = false;
                navigate(context, const SearchPatients());
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Patient Information",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
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
            children: [
              patientInfo(context, viewPatientNum),

              // searchPatientPageWidgets(context, searchBar);
            ],
          ),
        ));
  }

  Widget patientInfo(BuildContext context, int i) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x230F1113),
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text('Name', style: body1(Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            viewPatient.name,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Birthday: ',
                      style: body1(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      viewPatient.bday,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color.fromARGB(255, 87, 87, 87)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Sex',
                      style: body1(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    viewPatient.sex,
                    style: body1(const Color.fromARGB(255, 87, 87, 87)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Contact No.',
                      style: body1(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    viewPatient.contact,
                    style: body1(const Color.fromARGB(255, 87, 87, 87)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Marital Status',
                      style: body1(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    viewPatient.marital,
                    style: body1(const Color.fromARGB(255, 87, 87, 87)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Address',
                      style: body1(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    viewPatient.address,
                    style: body1(const Color.fromARGB(255, 87, 87, 87)),
                  ),
                ],
              ),
            ),
            treatmentsWidget(context)
          ],
        ),
      ),
    );
  }

  Widget treatmentsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: const Color(0xFFEEEEEE),
        ),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text('Tooth #',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: mainColor)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Surface',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: mainColor)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Description of Services',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: mainColor)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: mainColor)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text('Fee',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: mainColor)),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          thickness: 1,
                          indent: 8,
                          endIndent: 8,
                          color: mainColor),
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
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                child: Text(
                  viewPatient.dentalRecords[n].toothNum.toString(),
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
                  viewPatient.dentalRecords[n].surface.toString(),
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
                  viewPatient.dentalRecords[n].description.toString(),
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
                  unixToString(viewPatient.dentalRecords[n].transDate),
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
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
                child: Text(
                  viewPatient.dentalRecords[n].fee.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
