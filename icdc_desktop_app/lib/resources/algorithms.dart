// ignore_for_file: unrelated_type_equality_checks

import 'package:icdc_desktop_app/global_variables.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/patient-entry.dart';
import 'patient_object.dart';

void swap(List<int> l, int i, int j) {
  int temp = l[i];
  l[i] = l[j];
  l[j] = temp;
}

void merge(List<int> lst, int left, int mid, int right) {
  int i = left, j = mid + 1;
  List<int> temp = [];

  while (i <= mid && j <= right) {
    if (lst[i] < lst[j]) {
      temp.add(lst[i++]);
    } else {
      temp.add(lst[j++]);
    }
  }
  while (i <= mid) {
    temp.add(lst[i++]);
  }
  while (j <= right) {
    temp.add(lst[j++]);
  }
  for (int k = left; k <= right; k++) {
    lst[k] = temp[k - left];
  }
}

void sort(List<int> lst, int left, int right) {
  if (left >= right) return;
  int mid = (left + right) ~/ 2;

  sort(lst, left, mid);
  sort(lst, mid + 1, right);
  merge(lst, left, mid, right);
}

void mergeString(arr, int l, int m, int r) {
  // Find sizes of two subarrays to be merged
  var n1 = m - l + 1;
  var n2 = r - m;

  /* Create temp arrays */
  var leftList = List.filled(n1.toInt(), "");
  var rightList = List.filled(n2.toInt(), "");

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
    if (leftList[i].compareTo(rightList[j]) <= 0) {
      arr[k] = leftList[i];
      i++;
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

void sortString(arr, int l, int r) {
  if (l < r) {
    // Find the middle point
    var m = l + (r - l) / 2;
    m.toInt();

    // Sort first and second halves
    sortString(arr, l, m.toInt());
    sortString(arr, (m + 1).toInt(), r);

    // Merge the sorted halves
    mergeString(arr, l, m.toInt(), r);
  }
}

//SORT TREATMENTS
PatientObject sortTreatment(PatientObject patientObject) {
  List<int> mainList = [];
  List<DentalRecord> records = patientObject.dentalRecords;
  List<DentalRecord> sortedRecords = [];

  for (DentalRecord dentalRecord in records) {
    mainList.add(dentalRecord.transDate);
  }

  print("Before: $mainList");
  sort(mainList, 0, mainList.length - 1);
  print("After: $mainList");

  for (int time in mainList) {
    sortedRecords
        .add(records.firstWhere((element) => element.transDate == time));
  }

  patientObject.dentalRecords = sortedRecords.reversed.toList();

  return patientObject;
}

//SORT PATIENTS BY NAME
List<PatientObject> sortPatients() {
  List<String> mainList = [];
  List<PatientObject> records = listPatients;
  List<PatientObject> sortedRecords = [];

  for (PatientObject patient in records) {
    mainList.add(patient.name);
  }

  print("Before: $mainList");
  sortString(mainList, 0, mainList.length - 1);
  print("After: $mainList");

  for (String name in mainList) {
    sortedRecords.add(records.firstWhere((element) => element.name == name));
  }

  print(sortedRecords[0].name);

  return sortedRecords;
}

//SORT PATIENTS BY DATE
List<PatientObject> sortPatientsDate() {
  List<int> mainList = [];
  List<PatientObject> records = listPatients;
  List<PatientObject> sortedPatients = [];
  List<String> patientIdsList = [];

  for (PatientObject patient in records) {
    mainList.add(patient.dentalRecords.last.transDate);
    patientIdsList.add(patient.patientID);
  }

  print("Before: $mainList");
  sort(mainList, 0, mainList.length - 1);
  print("After: $mainList");

  for (int time in mainList) {
    var temp = records
        .where((element) => element.dentalRecords.last.transDate == time)
        .toList();

    sortedPatients.addAll(temp);
  }

  print(sortedPatients);
  return sortedPatients.reversed.toList();
}

//SORT PATIENTS BY TREATMENT
List<PatientObject> sortPatientsTreatment() {
  List<String> mainList = [];
  List<PatientObject> records = listPatients;
  List<PatientObject> sortedPatients = [];
  List<String> patientIdsList = [];

  for (PatientObject patient in records) {
    mainList.add(patient.dentalRecords[0].description);
    patientIdsList.add(patient.patientID);
  }

  print("Before: $mainList");
  sortString(mainList, 0, mainList.length - 1);
  print("After: $mainList");

  for (String time in mainList) {
    sortedPatients.add(records.firstWhere((element) =>
        element.dentalRecords[0].transDate == time &&
        !patientIdsList.contains(element.patientID)));
  }

  return sortedPatients;
}

List<PatientObject> searchPatientsName(String searchTerm) {
  List<PatientObject> records = sortPatients();

  int startIndex = records.indexWhere((element) =>
      element.name.toLowerCase().contains(searchTerm.toLowerCase()));

  if (startIndex == -1) {
    return records;
  }

  int endIndex = records.lastIndexWhere((element) =>
      element.name.toLowerCase().contains(searchTerm.toLowerCase()));

  print(startIndex);
  print(endIndex);

  if (startIndex == endIndex) {
    List<PatientObject> searched = [];
    searched.add(records[startIndex]);
    return searched;
  }
  return records.getRange(startIndex, endIndex + 1).toList();
}

List<PatientObject> searchPatientsDate(int searchTerm) {
  List<PatientObject> records = sortPatients();

  int startIndex = records.indexWhere((element) =>
      element.dentalRecords
          .indexWhere((element) => element.transDate == searchTerm) !=
      -1);

  if (startIndex == -1) {
    return records;
  }

  int endIndex = records.lastIndexWhere((element) =>
      element.dentalRecords
          .indexWhere((element) => element.transDate == searchTerm) !=
      -1);

  print(startIndex);
  print(endIndex);

  if (startIndex == endIndex) {
    List<PatientObject> searched = [];
    searched.add(records[startIndex]);
    return searched;
  }
  return records.getRange(startIndex, endIndex + 1).toList();
}

List<PatientObject> searchPatientsTreatment(String searchTerm) {
  List<PatientObject> records = sortPatients();

  int startIndex = records.indexWhere((element) =>
      element.dentalRecords.indexWhere((element) => element.description
          .toLowerCase()
          .contains(searchTerm.toLowerCase())) !=
      -1);

  if (startIndex == -1) {
    return records;
  }

  int endIndex = records.lastIndexWhere((element) =>
      element.dentalRecords.indexWhere((element) => element.description
          .toLowerCase()
          .contains(searchTerm.toLowerCase())) !=
      -1);

  print(startIndex);
  print(endIndex);

  if (startIndex == endIndex) {
    List<PatientObject> searched = [];
    searched.add(records[startIndex]);
    return searched;
  }
  return records.getRange(startIndex, endIndex + 1).toList();
}
