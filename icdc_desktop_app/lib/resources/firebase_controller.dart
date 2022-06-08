import 'package:firedart/firedart.dart';
import 'package:icdc_desktop_app/resources/global_variables.dart';
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
    }

    // listPatients.add(patient);
  }
}

class FirebaseController {}
