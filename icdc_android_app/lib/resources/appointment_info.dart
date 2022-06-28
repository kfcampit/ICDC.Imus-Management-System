import 'dart:convert';

class AppointmentObj {
  String name = "";
  String date = "";
  // int dateInUnix = 0;
  String time = "";
  String service = "";
  String status = "";

  List<Appointment> appointmentInfo = [];
}

class Appointment {
  String name = "";
  String surface = "";
  String description = "";
  int transDate = 0;
  int fee = 0;
}



// class AppointmentInfo {
//   static final String id = 'ID';
//   static final String name = 'Name';
//   static final String date = 'Date';
//   static final String time = 'Time';
//   static final String service = 'Service';
//   static List<String> getInfo() => [id, name, date, time, service];

// }

// class Info {
//     final int? id;
//     final String name;
//     final String date;
//     final String time;
//     final String service;

//     const Info({
//       this.id,
//       required this.name,
//       required this.date,
//       required this.time,
//       required this.service,
//     });

//     Map<String, dynamic> toJson() => {
//       AppointmentInfo.id: id,
//       AppointmentInfo.name: name,
//       AppointmentInfo.date: date,
//       AppointmentInfo.time: time,
//       AppointmentInfo.service: service,
//     };
//     static Info fromJson(Map<String, dynamic> json) => Info(
//       id:jsonDecode(json[AppointmentInfo.id]),
//       name:json[AppointmentInfo.name],
//       date:json[AppointmentInfo.date],
//       time:json[AppointmentInfo.time],
//       service:json[AppointmentInfo.service]
//     );
//   }