library globals;

import 'package:flutter/material.dart';
import 'package:icdc_android_app/resources/appointment_object.dart';
import 'package:icdc_android_app/resources/patient_object.dart';

// open appointments
List appointmentList = [];
bool firstTimeRun = true;
// open appointments

// serach patients
TextEditingController nameController = TextEditingController();
TextEditingController searchController = TextEditingController();
//patient entry
TextEditingController bdayController = TextEditingController();
TextEditingController maritalController = TextEditingController();
TextEditingController sexController = TextEditingController();
TextEditingController contactController = TextEditingController();
TextEditingController addressController = TextEditingController();

TextEditingController toothNumController = TextEditingController();
TextEditingController surfaceController = TextEditingController();
TextEditingController serviceController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController feeController = TextEditingController();

//patient entry
// check inventory

TextEditingController itemController = TextEditingController();
TextEditingController quantityController = TextEditingController();
bool editPressed = false;
String addSaveButton = "Add Item";
//check inventory

PatientObject patient = PatientObject();

List<PatientObject> listPatients = [];
List<PatientObject> sortedPatients = [];
List<PatientObject> searchedPatients = [];
