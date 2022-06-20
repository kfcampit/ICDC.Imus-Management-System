library globals;

import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/resources/item_object.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';

//patient entry
TextEditingController nameController = TextEditingController();
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

TextEditingController searchController = TextEditingController();

// check inventory
List<ItemObject> inventoryItems = [];

TextEditingController itemController = TextEditingController();
TextEditingController quantityController = TextEditingController();

int editNumber = inventoryItems.length;
bool editPressed = false;
String addSaveButton = "Add Item";
//check inventory

PatientObject patient = PatientObject();

List<PatientObject> listPatients = [];
List<PatientObject> sortedPatients = [];
List<PatientObject> searchedPatients = [];
