import 'package:icdc_android_app/resources/appointment_object.dart';

void main(){
  List appointmentList = [
    new AppointmentObject("Kobi Rasing", "7-26-2022", "3:00 PM"),
    new AppointmentObject("Kyle Campit", "1-24-2022", "9:00 AM"),
    new AppointmentObject("Jian Mendoza", "7-14-2022", "9:00 PM"),
    new AppointmentObject("Toni Illahi", "9-12-2022", "4:00 PM"),
    new AppointmentObject("Jian Mendoza", "7-26-2022", "12:30 PM"),
    new AppointmentObject("Steven Obico", "1-24-2022", "1:00 PM"),
    new AppointmentObject("Melvin Cabatuan", "6-24-2022", "9:00 AM"),
    new AppointmentObject("Edwin Concepcion", "6-24-2022", "6:00 AM")
    ];

  print("Before:");
  for (var patient in appointmentList) {
    patient.convertToOriginalDate(patient.date);
    patient.timeTo12Hour(patient.time);
    print("Patient: " + patient.name + ", Date: " + patient.date + ", Time: " + patient.time);
    patient.convertDate(patient.date);
    patient.timeTo24Hour(patient.time);
  }
  print("");

  sort(appointmentList, 0, appointmentList.length-1);

  print("--------------------------------------------------------");
  print("\nAfter:");
  for (var patient in appointmentList) {
    patient.convertToOriginalDate(patient.date);
    patient.timeTo12Hour(patient.time);
    print("Patient: " + patient.name + ", Date: " + patient.date + ", Time: " + patient.time);
  }
  print("");
}

void merge(arr, int l, int m, int r) {
  // Find sizes of two subarrays to be merged
  var n1 = m - l + 1;
  var n2 = r - m;
  
  /* Create temp arrays */
  AppointmentObject filler = AppointmentObject("John Doe", "01-01-2022", "00:00");
  List<AppointmentObject> leftList = List.filled(n1.toInt(), filler);
  List<AppointmentObject> rightList = List.filled(n2.toInt(), filler);

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
    if (leftList[i].date.compareTo(rightList[j].date) < 0) {
      arr[k] = leftList[i];
      i++;
    } 
    else if (leftList[i].date.compareTo(rightList[j].date) == 0) {
      if (leftList[i].time.compareTo(rightList[j].time) < 0) {
        arr[k] = leftList[i];
        i++;
      } 
      else if (leftList[i].time.compareTo(rightList[j].time) == 0) {
        if (leftList[i].name.compareTo(rightList[j].name) <= 0) {
          arr[k] = leftList[i];
          i++;
        } 
        else {
          arr[k] = rightList[j];
          j++;
        }
      }
      else {
        arr[k] = rightList[j];
        j++;
      }
    }
    else {
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

// Main function that sorts arr[l..r] using
// merge()
void sort(arr, int l, int r) {
  if (l < r) {
    // Find the middle point
    var m = l + (r - l) / 2;
    m.toInt();

    // Sort first and second halves
    sort(arr, l, m.toInt());
    sort(arr, (m + 1).toInt(), r);

    // Merge the sorted halves
    merge(arr, l, m.toInt(), r);
  }
}