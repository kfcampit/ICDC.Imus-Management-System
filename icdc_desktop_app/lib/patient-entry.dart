import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/patient-view.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/firebase_controller.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'dart:core';
import '/global_variables.dart';

bool isEditPatient = false;

class PatientEntryPage extends StatefulWidget {
  const PatientEntryPage({Key? key}) : super(key: key);

  @override
  PatientEntry createState() => PatientEntry();
}

class PatientEntry extends State<PatientEntryPage> {
  @override
  void initState() {
    super.initState();
    if (isEditPatient) {
      nameController.text = viewPatient.name;
      bdayController.text = viewPatient.bday;
      contactController.text = viewPatient.contact;
      sexController.text = viewPatient.sex;
      maritalController.text = viewPatient.marital;
      addressController.text = viewPatient.address;

      patient = viewPatient;
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
            child: Text('Patient Information Entry',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff4b39ef))),
          ),
          textInputs(context),
        ]),
  );
}

Widget textInputs(BuildContext context) {
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: TextFormField(
                          controller: nameController,
                          autofocus: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Dela Cruz, Juan',
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
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: TextFormField(
                      controller: bdayController,
                      autofocus: true,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Date of Birth',
                        hintText: "12-31-2022",
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
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      keyboardType: TextInputType.datetime,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: TextFormField(
                    controller: maritalController,
                    autofocus: true,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Marital Status',
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
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: TextFormField(
                    controller: sexController,
                    autofocus: true,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Sex',
                      hintText: "M/F",
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
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextFormField(
                    controller: contactController,
                    autofocus: true,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Contact Number',
                      hintText: "09#########",
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
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ]),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: TextFormField(
          controller: addressController,
          autofocus: true,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Address',
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
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
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
                color: const Color(0xff4b39ef),
                text: "Cancel",
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
                  text: "Save",
                  function: enterPatientInfo,
                  context: context,
                  page: const ICDCDesktop(),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(60, 0, 0, 8),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: roundedButtons(
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white),
                        height: 40,
                        width: 160,
                        color: const Color(0xff4b39ef),
                        text: "Add Treatment",
                        function: addTreatmentButton,
                        navFunction: navigate,
                        context: context,
                        page: const PatientEntryPage(),
                      ),
                    ),
                  ]))),
    ),
  );
}

Widget treatmentRows(BuildContext context) {
  List<Widget> widgetList = [];
  int n = patient.dentalRecords.length;

  for (int i = 0; i < n; i++) {
    widgetList.add(listTreatments(i, context));
  }

  widgetList.add(inputTreatment(context));

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

Widget listTreatments(int i, BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromARGB(255, 252, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 20,
              ),
              iconSize: 20,
              onPressed: () {
                removeTreatmentButton(i);
                navigate(context, const PatientEntryPage());
              },
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              child: Text(
                patient.dentalRecords[i].toothNum.toString(),
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
                patient.dentalRecords[i].surface.toString(),
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
                patient.dentalRecords[i].description.toString(),
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
                patient.dentalRecords[i].transDate.toString(),
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
                patient.dentalRecords[i].fee.toString(),
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

Widget inputTreatment(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(60, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: toothNumController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Tooth Number",
                  border: UnderlineInputBorder(),
                ),
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
              child: TextField(
                textAlign: TextAlign.center,
                controller: surfaceController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Surface",
                  border: UnderlineInputBorder(),
                ),
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
              child: TextField(
                textAlign: TextAlign.center,
                controller: serviceController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Description of Services",
                  border: UnderlineInputBorder(),
                ),
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
              child: TextField(
                textAlign: TextAlign.center,
                controller: dateController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Date",
                  border: UnderlineInputBorder(),
                ),
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
              child: TextField(
                textAlign: TextAlign.center,
                controller: feeController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Fee",
                  border: UnderlineInputBorder(),
                ),
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

void test() {
  print("test button");
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

void removeTreatmentButton(int i) {
  patient.dentalRecords.removeAt(i);
}

void enterPatientInfo() {
  patient.name = nameController.text;
  patient.bday = bdayController.text;
  patient.contact = contactController.text;
  patient.sex = sexController.text;
  patient.marital = maritalController.text;
  patient.address = addressController.text;

  try {
    addTreatmentButton();
    // ignore: empty_catches
  } catch (Exception) {}

  if (!isEditPatient) {
    addPatient(patient);
  } else {
    print(patient.dentalRecords);
    editPatient(patient.patientID, patient);
  }

  /*
  print("Name: " + patient.name);
  print("Birthday: " + patient.bday);
  print("Marital: " + patient.marital);
  print("Sex: " + patient.sex);
  print("Contact Number: " + patient.contact);
  print("Address: " + patient.address);

  for (int i = 1; i <= patient.dentalRecords.length; ++i) {
    print("-------------------------------------------------------------");
    print("Dental Record #$i:");
    print("Tooth Num: " + patient.dentalRecords[i - 1].toothNum.toString());
    print("Surface: " + patient.dentalRecords[i - 1].surface);
    print("Service or Treatment: " + patient.dentalRecords[i - 1].description);
    print("Transaction Date: " +
        patient.dentalRecords[i - 1].transDate.toString());
    print("Fee: " + patient.dentalRecords[i - 1].fee.toString());
    print("-------------------------------------------------------------");
  }
  */

  nameController.clear();
  bdayController.clear();
  contactController.clear();
  sexController.clear();
  maritalController.clear();
  addressController.clear();
  toothNumController.clear();
  surfaceController.clear();
  serviceController.clear();
  dateController.clear();
  feeController.clear();

  patient = PatientObject();
  isEditPatient = false;
}
