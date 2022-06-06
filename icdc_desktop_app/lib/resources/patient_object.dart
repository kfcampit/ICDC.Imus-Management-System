class PatientObject {
  String patientID = "";
  String name = "";
  String sex = "";
  String bday = "";
  String contact = "";
  String marital = "";
  String address = "";

  var dentalRecords = [];
}

class DentalRecord {
  int toothNum = 0;
  String description = "";
  int transDate = 0;
  int fee = 0;

  DentalRecord(this.toothNum, this.description, this.transDate, this.fee);
}
