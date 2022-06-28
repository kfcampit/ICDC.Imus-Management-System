class AppointmentObject {
  String name = "";
  String date = "";
  int dateInUnix = 0;
  String time = "";
  String service = "";
  String status = "";

  AppointmentObject(
      this.name, this.date, this.time, this.service, this.status) {
    // Convert date format MM-DD-YYYY to YYYY-MM-DD
    convertDate(date);
    // Convert date to unix
    dateInUnix = dateToUnix(date);
    // Convert time format 11:59 PM to 23:59
    timeTo24Hour(time);
  }

  int dateToUnix(String sdatetime) {
    /* Input Format: YYYY-MM-DD" */
    DateTime sdate = DateTime.parse(sdatetime);
    int stimestamp = sdate.millisecondsSinceEpoch;
    return stimestamp;
  }

  String unixToDate(int timestamp) {
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String datetime = tsdate.month.toString() +
        "-" +
        tsdate.day.toString() +
        "-" +
        tsdate.year.toString();
    return datetime;
  }

  void convertDate(String inputDate) {
    List splittedDate = inputDate.split("-");
    String month = splittedDate[0];
    String day = splittedDate[1];
    String year = splittedDate[2];

    if (month.length != 2) month = "0" + splittedDate[0];
    if (day.length != 2) day = "0" + splittedDate[1];

    date = "$year-$month-$day";
  }

  void convertToOriginalDate(String convertedDate) {
    List splittedDate = convertedDate.split("-");
    String year = splittedDate[0];
    String month = splittedDate[1];
    String day = splittedDate[2];

    if (month.length != 2) month = "0" + splittedDate[0];
    if (day.length != 2) day = "0" + splittedDate[1];

    date = "$month-$day-$year";
  }

  void timeTo24Hour(String iTime) {
    String typeOfDay = iTime.substring(iTime.length - 2);
    if (typeOfDay == "PM") {
      try {
        if (iTime.substring(0, 2) == "12")
          time = iTime.substring(0, 5);
        else
          time = (int.parse(iTime.substring(0, 2)) + 12).toString() +
              iTime.substring(2, 5);
      } catch (e) {
        time = (int.parse(iTime.substring(0, 1)) + 12).toString() +
            iTime.substring(1, 4);
      }
    } else {
      if (iTime.length == 7)
        time = "0" + iTime.substring(0, 4);
      else
        time = iTime.substring(0, 5);
    }
  }

  void timeTo12Hour(String iTime) {
    if (iTime.substring(0, 2) == "00")
      time = "12" + iTime.substring(2) + " AM";
    else if (int.parse(iTime.substring(0, 2)) < 12)
      time = iTime + " AM";
    else if (int.parse(iTime.substring(0, 2)) == 12)
      time = iTime + " PM";
    else if ((int.parse(iTime.substring(0, 2)) - 12).toString().length < 2)
      time = "0" +
          (int.parse(iTime.substring(0, 2)) - 12).toString() +
          iTime.substring(2) +
          " PM";
    else
      time = (int.parse(iTime.substring(0, 2)) - 12).toString() +
          iTime.substring(2) +
          " PM";
  }
}

void main() {
  // AppointmentObject obj =
  //     AppointmentObject("Kobi Rasing", "07-05-2002", "8:00 AM", "Cleaning");

  // print("New Date: " + obj.date);
  // print("Unix Date: " + obj.dateInUnix.toString());
  // print("Original Date: " + obj.unixToDate(obj.dateInUnix));
  // print("Time: " + obj.time);
}
