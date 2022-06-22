import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:icdc_desktop_app/global_variables.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'package:icdc_desktop_app/resources/item_object.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveToCSV() async {
  List<List<dynamic>> dataTable = [[]];
  List<dynamic> temp = [];

  for (PatientObject p in listPatients) {
    temp = [];

    temp.addAll(
        [p.patientID, p.name, p.bday, p.marital, p.sex, p.contact, p.address]);

    for (DentalRecord d in p.dentalRecords) {
      temp.addAll([
        d.toothNum,
        d.surface,
        d.description,
        DateTime.fromMicrosecondsSinceEpoch(d.transDate),
        d.fee
      ]);
    }
    dataTable.add(temp);
  }

  String csvData = ListToCsvConverter().convert(dataTable);
  String saveDirectory = (await getApplicationDocumentsDirectory()).path;
  var path = "$saveDirectory/ICDC-Imus-CMS/patient-data.csv";
  File file = File(path);

  file.create(recursive: true);

  await file.writeAsString(csvData);
}

Future<void> saveInventoryData() async {
  List<List<dynamic>> dataTable = [[]];

  for (ItemObject item in inventoryItems) {
    dataTable.add([item.name, item.quantity]);
  }

  String csvData = ListToCsvConverter().convert(dataTable);
  String saveDirectory = (await getApplicationDocumentsDirectory()).path;
  var path = "$saveDirectory/ICDC-Imus-CMS/inventory.csv";
  File file = File(path);

  file.create(recursive: true);

  await file.writeAsString(csvData);
}

Future<void> readInventoryData() async {
  String saveDirectory = (await getApplicationDocumentsDirectory()).path;
  var path = "$saveDirectory/ICDC-Imus-CMS/inventory.csv";
  final File file = new File(path);

  file.create(recursive: true);

  final csvFile = file.openRead();

  List<List<dynamic>> dataTable = await csvFile
      .transform(utf8.decoder)
      .transform(const CsvToListConverter())
      .toList();

  dataTable.removeAt(0);
  for (List<dynamic> row in dataTable) {
    inventoryItems.add(ItemObject(row[0], row[1]));
  }
}

Future<void> saveSettings() async {
  List<List<dynamic>> dataTable = [[]];

  dataTable.add([patientsPerPage]);

  String csvData = ListToCsvConverter().convert(dataTable);
  String saveDirectory = (await getApplicationDocumentsDirectory()).path;
  var path = "$saveDirectory/ICDC-Imus-CMS/settings.csv";
  File file = File(path);

  file.create(recursive: true);

  await file.writeAsString(csvData);
}

Future<void> readSettings() async {
  String saveDirectory = (await getApplicationDocumentsDirectory()).path;
  var path = "$saveDirectory/ICDC-Imus-CMS/settings.csv";
  final File file = new File(path);

  file.create(recursive: true);

  final csvFile = file.openRead();

  List<List<dynamic>> dataTable = await csvFile
      .transform(utf8.decoder)
      .transform(const CsvToListConverter())
      .toList();

  dataTable.removeAt(0);
  for (List<dynamic> row in dataTable) {
    patientsPerPage = row[0];
  }
}
