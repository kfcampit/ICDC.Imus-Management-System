class PatientObject {
  String patientID = "";
  String name = "";
  String sex = "";
  String bday = "";
  String contact = "";
  String marital = "";
  String address = "";

  List dentalRecords = [];
}

class DentalRecord {
  String toothNum = "";
  String surface = "";
  String description = "";
  String transDate = "";
  int fee = 0;
}
