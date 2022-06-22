import 'dart:collection';

import 'package:firedart/firedart.dart';
import 'package:icdc_desktop_app/global_variables.dart';
import 'package:icdc_desktop_app/resources/algorithms.dart';
import 'package:icdc_desktop_app/resources/patient_object.dart';
import 'package:icdc_desktop_app/main.dart';

// ignore: prefer_typing_uninitialized_variables
Firestore db = Firestore.instance;

Future<void> loadPatients() async {
  var fromDB = await db.collection('patients').get();

  for (int i = 0; i < fromDB.length; i++) {
    PatientObject patient = PatientObject();

    var temp = fromDB[i];

    patient.patientID = temp.id;
    patient.name = temp['name'];
    patient.sex = temp['sex'];
    patient.bday = temp['bday'];
    patient.contact = temp['contact'];
    patient.marital = temp['marital'];
    patient.address = temp['address'];

    var dentRec = await db
        .collection('patients')
        .document(temp.id)
        .collection('dentalRecords')
        .get();

    for (int j = 0; j < dentRec.length; j++) {
      DentalRecord dentalRecord = DentalRecord();
      temp = dentRec[j];

      dentalRecord.toothNum = temp['toothNum'];
      dentalRecord.surface = temp['surface'];
      dentalRecord.description = temp['description'];
      dentalRecord.transDate = temp['transDate'];
      dentalRecord.fee = temp['fee'];

      patient.dentalRecords.add(dentalRecord);
    }

    listPatients.add(sortTreatment(patient));
  }
}

void addPatient(PatientObject patientObject) {
  String patientId =
      'P-' + (listPatients.length + 1).toString().padLeft(6, '0');

  HashMap<String, Object> hashPatients = HashMap();
  HashMap<String, Object> dentRecs = HashMap();

  hashPatients['address'] = patientObject.address;
  hashPatients['bday'] = patientObject.bday;
  hashPatients['contact'] = patientObject.contact;
  hashPatients['marital'] = patientObject.marital;
  hashPatients['name'] = patientObject.name;
  hashPatients['sex'] = patientObject.sex;

  db.collection('patients').document(patientId).set(hashPatients);

  for (int i = 0; i < patientObject.dentalRecords.length; i++) {
    String dentId = 'D-' + (i + 1).toString().padLeft(6, '0');

    dentRecs['description'] = patientObject.dentalRecords[i].description;
    dentRecs['fee'] = patientObject.dentalRecords[i].fee;
    dentRecs['surface'] = patientObject.dentalRecords[i].surface;
    dentRecs['toothNum'] = patientObject.dentalRecords[i].toothNum;
    dentRecs['transDate'] = patientObject.dentalRecords[i].transDate;

    db
        .collection('patients')
        .document(patientId)
        .collection('dentalRecords')
        .document(dentId)
        .set(dentRecs);
  }

  listPatients.add(sortTreatment(patientObject));
}

Future<void> editPatient(String patientId, PatientObject patientObject) async {
  HashMap<String, Object> hashPatients = HashMap();
  HashMap<String, Object> dentRecs = HashMap();

  hashPatients['address'] = patientObject.address;
  hashPatients['bday'] = patientObject.bday;
  hashPatients['contact'] = patientObject.contact;
  hashPatients['marital'] = patientObject.marital;
  hashPatients['name'] = patientObject.name;
  hashPatients['sex'] = patientObject.sex;

  db.collection('patients').document(patientId).set(hashPatients);

  var dentRec = await db
      .collection('patients')
      .document(patientId)
      .collection('dentalRecords')
      .get();

  for (int i = 0; i < dentRec.length; i++) {
    await db
        .document('patients/' + patientId + '/dentalRecords/' + dentRec[i].id)
        .delete();
  }

  for (int i = 0; i < patientObject.dentalRecords.length; i++) {
    String dentId = 'D-' + (i + 1).toString().padLeft(6, '0');

    dentRecs['description'] = patientObject.dentalRecords[i].description;
    dentRecs['fee'] = patientObject.dentalRecords[i].fee;
    dentRecs['surface'] = patientObject.dentalRecords[i].surface;
    dentRecs['toothNum'] = patientObject.dentalRecords[i].toothNum;
    dentRecs['transDate'] = patientObject.dentalRecords[i].transDate;
    dentRecs['isVisible'] = true;

    db
        .collection('patients')
        .document(patientId)
        .collection('dentalRecords')
        .document(dentId)
        .set(dentRecs);
  }

  listPatients.removeWhere((element) => element.patientID == patientId);
  listPatients.add(patientObject);
}

int getNumPatients() {
  return listPatients.length;
}

class FirebaseController {}
