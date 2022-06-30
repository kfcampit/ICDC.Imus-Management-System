class PatientObject {
  String patientID = "";
  String name = "";
  String sex = "";
  String bday = "";
  String contact = "";
  String marital = "";
  String address = "";

  List<DentalRecord> dentalRecords = [];
}

class DentalRecord {
  String toothNum = "";
  String surface = "";
  String description = "";
  int transDate = 0;
  double fee = 0;
}
