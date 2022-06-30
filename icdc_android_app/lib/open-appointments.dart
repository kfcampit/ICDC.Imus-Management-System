import 'dart:convert';

import 'package:firedart/auth/user_gateway.dart';
import 'package:flutter/material.dart';
import 'package:icdc_android_app/appointment-view.dart';
import 'package:icdc_android_app/resources/appointment_object.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/google_sheets_api.dart';
import 'main.dart';
import 'package:gsheets/gsheets.dart';

class OpenAppointments extends StatefulWidget {
  const OpenAppointments({Key? key}) : super(key: key);

  @override
  OpenAppointmentsPage createState() => OpenAppointmentsPage();
}

class OpenAppointmentsPage extends State<OpenAppointments> {
  @override
  void initState() {
    /* Sample lang for appointmentList */
    if (firstTimeRun) {
      collectAppointments(appointmentObjList);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(appointmentList.length);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: mainColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                navigate(
                    context, const MyHomePage(title: 'Flutter Demo Home Page'));
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Appointments",
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
            children: [myAppointments(context)],
          ),
        ));
  }
}

Widget myAppointments(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.84,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text('My Appointments',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: mainColor)),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        thickness: 1,
                        indent: 8,
                        endIndent: 8,
                        color: Color(0xff4b39ef)),
                    eachAppointment(context),
                  ]))),
    ),
  );
}

Widget eachAppointment(BuildContext context) {
  List<Widget> widgetList = [];
  // int n = appointmentList.length; /* eto official na gamitin */
  int n = appointmentList.length;

  for (int i = 0; i < n; i++) {
    widgetList.add(displayAppointment(i, context));
  }

  firstTimeRun = false;

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

Widget displayAppointment(int i, BuildContext context) {
  // if (firstTimeRun) {
  //   appointmentList[i].convertToOriginalDate(appointmentList[i].date);
  // }
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
      child: GestureDetector(
          onTap: () {
            viewAppointmentNum = i;
            navigate(context, const AppointmentViewPage());
          },
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 11, 0, 23),
                        child: Text(appointmentList[i].service,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Color.fromARGB(255, 252, 0, 0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 16,
                            ),
                            iconSize: 16,
                            onPressed: () {
                              removeAppointment(i);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          OpenAppointments())));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Date: ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.white)),
                              Text(appointmentList[i].date,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.white)),
                            ])),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 10),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Name: ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.white)),
                              Text(appointmentList[i].name,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 239, 196, 57))),
                            ])),
                  ],
                )
              ],
            ),
          )));
}

void removeAppointment(int index) async {
  AppointmentObject appointmentObject = appointmentList[index];
  int rowIndex = appointmentObject.rowIndex;
  appointmentList.removeAt(index);
  await workSheet?.values.insertValue('true', column: 20, row: rowIndex);
}

void merge(arr, int l, int m, int r) {
  // Find sizes of two subarrays to be merged
  var n1 = m - l + 1;
  var n2 = r - m;

  /* Create temp arrays */
  AppointmentObject filler = AppointmentObject(
      "John Doe", "2022-01-01", "00:00", "Cleaning", "false", 2);
  List<AppointmentObject> leftList = List.filled(n1.toInt(), filler);
  List<AppointmentObject> rightList = List.filled(n2.toInt(), filler);

  /*Copy data to temp arrays*/
  for (int i = 0; i < n1; ++i) {
    leftList[i] = arr[l + i];
  }
  for (int j = 0; j < n2; ++j) {
    rightList[j] = arr[m + 1 + j];
  }

  /* Merge the temp arrays */

  // Initial indexes of first and second subarrays
  int i = 0, j = 0;

  // Initial index of merged subarray array
  int k = l.toInt();
  while (i < n1 && j < n2) {
    // dito pag yung Left[i] ay mas mauuna sa R[j]
    if (leftList[i].date.compareTo(rightList[j].date) < 0) {
      arr[k] = leftList[i];
      i++;
    } else if (leftList[i].date.compareTo(rightList[j].date) == 0) {
      if (leftList[i].time.compareTo(rightList[j].time) < 0) {
        arr[k] = leftList[i];
        i++;
      } else if (leftList[i].time.compareTo(rightList[j].time) == 0) {
        if (leftList[i].name.compareTo(rightList[j].name) <= 0) {
          arr[k] = leftList[i];
          i++;
        } else {
          arr[k] = rightList[j];
          j++;
        }
      } else {
        arr[k] = rightList[j];
        j++;
      }
    } else {
      arr[k] = rightList[j];
      j++;
    }
    k++;
  }

  /* Copy remaining elements of leftList[] if any */
  while (i < n1) {
    arr[k] = leftList[i];
    i++;
    k++;
  }

  /* Copy remaining elements of rightList[] if any */
  while (j < n2) {
    arr[k] = rightList[j];
    j++;
    k++;
  }
}

// Main function that sorts arr[l..r] using
// merge()
void sort(arr, int l, int r) {
  if (l < r) {
    // Find the middle point
    var m = l + (r - l) / 2;
    m.toInt();

    // Sort first and second halves
    sort(arr, l, m.toInt());
    sort(arr, (m + 1).toInt(), r);

    // Merge the sorted halves
    merge(arr, l, m.toInt(), r);
  }
}

void collectAppointments(List inputList) {
  sort(inputList, 0, inputList.length - 1);
  appointmentList.addAll(inputList);
}
