import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'dart:collection';
import 'global-variables.dart';

class PatientEntryPage extends StatefulWidget {
  const PatientEntryPage({Key? key}) : super(key: key);

  @override
  PatientEntry createState() => PatientEntry();
}

class PatientEntry extends State<PatientEntryPage> {
  @override
  void initState() {
    super.initState();
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
                            hintText: 'Juan Dela Cruz',
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
                  navFunction: navPlaceholder),
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
        decoration: const BoxDecoration(
          color: const Color(0xFFEEEEEE),
        ),
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
  );
}

Widget treatmentRows(BuildContext context) {
  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [individualTreatments(context)]);
}

Widget individualTreatments(BuildContext context) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 0+yCoordsTreatment*addTreatmentCount, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
              child: TextField(
                controller: toothNumController,
                cursorHeight: 24,
                decoration: const InputDecoration(
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
                controller: surfaceController,
                cursorHeight: 24,
                decoration: const InputDecoration(
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
                controller: serviceController,
                cursorHeight: 24,
                decoration: const InputDecoration(
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
                controller: dateController,
                cursorHeight: 24,
                decoration: const InputDecoration(
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
                controller: feeController,
                cursorHeight: 24,
                decoration: const InputDecoration(
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
  print("add treatment");
  addTreatmentCount++;
  DentalRecord dental = DentalRecord(int.parse(toothNumController.text), surfaceController.text, serviceController.text, dateController.text, int.parse(feeController.text));
  patient.dentalRecords.add(dental);

  print("Tooth Num: " + dental.toothNum.toString());
  print("Surface: " + dental.surface);
  print("Service or Treatment: " + dental.description);
  print("Transaction Date: " + dental.transDate);
  print("Fee: " + dental.fee.toString());

  toothNumController.clear();
  surfaceController.clear();
  serviceController.clear();
  dateController.clear();
  feeController.clear();
}

void removeTreatmentButton() {
  print("REMOVE TREATMENT");
  addTreatmentCount--;
}

void enterPatientInfo() {
  patient.name = nameController.text;
  patient.bday = bdayController.text;
  patient.contact = contactController.text;
  patient.sex = sexController.text;
  patient.marital = maritalController.text;
  patient.address = addressController.text;

  // print("SAVE BUTTON WORKING");
  print("Name: " + patient.name);
  print("Birthday: " + patient.bday);
  print("Marital: " + patient.marital);
  print("Sex: " + patient.sex);
  print("Contact Number: " + patient.contact);
  print("Address: " + patient.address);
  // underDentalRecords[toothNum] = underToothNum;

  // underToothNum["SURFACE"] = surface;
  // underToothNum["DESC_SERVICES"] = service;
  // underToothNum["DATE"] = date;
  // underToothNum["FEE"] = fee;

  // underPatientInfo[id] = underPatientId;

  // enter underPatientInfo HashMap to database after
}
