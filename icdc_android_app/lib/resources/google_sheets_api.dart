import 'dart:math';

import 'package:icdc_android_app/open-appointments.dart';
import 'package:icdc_android_app/resources/appointment_info.dart';
import 'package:gsheets/gsheets.dart';
import 'package:icdc_android_app/resources/appointment_object.dart';
import 'package:icdc_android_app/resources/global_variables.dart';

String sheetName = 'Form Responses 1';
final spreadsheetId = '1oejV9o1JcK0t-PG0n5cUzjnvmKri74Z1I2nkunQ4oyc';

// List<AppointmentObject> appointments = [];
const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "icdc-appointments",
  "private_key_id": "f0cbf83643952d0ca9c784566f4dae5cc45154c0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC+S1FQCcPbFfWe\nuHjG7KN80W4ghLnWpXQ0kWt7qUnVpxfPV7/Fxt4gHRmiTKfqCr20D502tlb/ovbI\nGcr1O4fg/aFaf8o34IRTucgaxKGbzOr8bXfZfk/viGORlpeLoEse+4tZptreagHr\nZHz/a3R8rwwDOxMr/VJP8IMcGIXjScNQu1O+gIK3NxIg1vGcZpr1hRhHD1Jahz3d\n6QBPWDGUugoGghXY5jUU49cJjXnDNjKC7YcYAMJHvNpY6tQetTBvRV0RAG+vPkJO\nEQuxFWfK96/OTPH5vUrxEtEzJ087miXTmZOEH20KOeMF+Vywm59HK7RMu8wzt9Rp\nRpeWlXzZAgMBAAECgf9ODJZNPbQXJ+qWLxNag7SKfVut+sI+R55h8UMkdUrTVrVt\nVZBSjj6M7WKWLtqwI7erIrxYtHD6aNzPNcUI0GHq5hxIAiHuySd9L7XjRMMEJAg9\ngKinjCc9F7O/AwUlP5mQG5wMKWOb1d7zrUOXf3tHqIREzvYOFNit8PfVjjlb/y7L\n+HiI8QzIILo16xUkxbw3oFh+41pLldxTsHLker8MEtJMuD4LAEPTDIMVX8at7MMT\nQ+FDGNsGRvA+ZF2v6i2WokVlpB6OWZ203Nj3wGRlJZgq8YACL+lMnhJDeO9CNAva\nwYRH9Qf6cINGR8n0lVg2tJFtiHqw+vWBsi8bQIECgYEA+Fe9xwlxjyTopInQZLGj\nEdg/dCF5m+j0bXy52qDBBjSQSttXht/8u0UcH5oL0vqzookHuU+HLd2WTaCBxasY\n62xuFIDNnUp2aYMRNLnDcp+fyI0S6095msK6LJuXyxctDQR+W8W4uLO//MJGxATM\nhnDoDudTLHiRinkgfx8MfUkCgYEAxClg2+6RLsKihSVMilP0l8SeembX6TJVe0KW\nGBK6LvfDqsECOje1hm19wN1/jkWU/bCwRmcB04I1RL7rOiToLddp6Wb3DG1jdyGa\nhuwbcSeXUcOSm4GUVzk/W70+k207l3Lw3XGqNbbaOdtdG8DYHjU6bP7DD1YRMs7b\nRNWO0xECgYAaYK9uoaknLCNtvpmc6GVKsu5idl/FWKQFsRbIiwSVlSWyXcPZNpdQ\niNGo5aLV4P0NiYKBg1n3XC7nxeGizj6SWu0CToAIce1L3bkJIaYJ2byN/7X/umxP\nLNm7fTdNQgPt+wk01DZ/n9AHl9cOYPgcW4e6dYWXFqNW0vDJr9GSyQKBgQCcbXrm\nJ9ry9RdxIgtljAnTNWJDrdukBRWR08mprNV4OvB4LK5ACsjhSFMuB/R+WhK0M8B+\nhAo6xuz/w1gF6ASW+d9l10xPRrQ4/j0iNwqzM6VB+Lni9HR9EhPqboGGQ2dwIKLf\nlJLtfsGLvdkEFsbBYCUVYhvfEP1qDPdibwMUYQKBgQC3Ovt6aZEF4USi2R85G4jj\nfaM6Yq0nhfA2WHl3WTKXYBoCgZOq+o4dfXA0ezF0L4daI93Wlg8DBml1Z4Ar0XRa\noUbgDSMPtTT25Zoptt6AmWL8tmaQ50Y20Frg4F/wJG8tzZbOaANCSZRwz6ErI9gx\nPAECeYMD5yjtCJvT8wy4Og==\n-----END PRIVATE KEY-----\n",
  "client_email": "icdc-imus@icdc-appointments.iam.gserviceaccount.com",
  "client_id": "111036310651675292761",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/icdc-imus%40icdc-appointments.iam.gserviceaccount.com"
}
  ''';
final gsheets = GSheets(_credentials);
Worksheet? workSheet;

class AppointmentSheetsApi {
  static Future init() async {
    final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
    workSheet = await getWorkSheet(spreadsheet, title: sheetName);
    allAppointmentRows.addAll(await workSheet!.values.allRows(fromRow: 2));
    loadAppointments();
    // print(await workSheet!.values.value(column: 2, row: 2));
  }

  static Future<Worksheet> getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}

Future<void> loadAppointments() async {
  // final allRows = await workSheet?.values.allRows(fromRow: 2);
  // print(allAppointmentRows[1][2]); // Prints name
  ;

  for (int i = 0; i < allAppointmentRows.length; i++) {
    // if (allAppointmentRows[i][19].toString()) {
    String name = allAppointmentRows[i][1];
    String date = allAppointmentRows[i][18];
    String time = allAppointmentRows[i][0];
    String service = allAppointmentRows[i][17];
    String status = allAppointmentRows[i][19];
    print(i.toString() + " name: " + name);
    print(i.toString() + " date: " + date);
    print(i.toString() + " time: " + time);
    print(i.toString() + " service: " + service);
    print(i.toString() + " status: " + status);
    // }
    // list.add(AppointmentObject(name, date, time, service, status));
    List list = [new AppointmentObject(name, date, time, service, status)];
    collectAppointments(list);
  }
  // var r = await workSheet?.values.row(2);
}

  // static User fromJson(Map<String, dynamic> json) => User(
  //     id: jsonDecode(json[AppointmentInfo.id]),
  //     name: json[AppointmentInfo.name],
  //     date: json[AppointmentInfo.date],
  //     time: json[AppointmentInfo.time],
  //     service: json[AppointmentInfo.service]
  // );
  // Map<String, dynamic> toJson() => {
  //   AppointmentInfo.id: id,
  //   AppointmentInfo.name: name,
  //   AppointmentInfo.date: date,
  //   AppointmentInfo.time: time,
  //   AppointmentInfo.service: service,
  // }