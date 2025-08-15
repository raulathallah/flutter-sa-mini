import 'package:flutter/foundation.dart';
import 'package:hr_attendance_tracker/models/attendance.dart';
import 'package:intl/intl.dart';

class AttendanceProviders extends ChangeNotifier {
  String nowTime = DateFormat('HH:mm').format(DateTime.now());
  String nowDate = DateTime.now().toString();
  // static final List<Map<String, dynamic>> _attendancesRaw = [
  //   {
  //     'day': 'Friday',
  //     'date': '2025-08-01',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0, // int
  //     'progressValue': 0.0, // double
  //   },
  //   {
  //     'day': 'Saturday',
  //     'date': '2025-08-02',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Sunday',
  //     'date': '2025-08-03',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Monday',
  //     'date': '2025-08-04',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Tuesday',
  //     'date': '2025-08-05',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Wednesday',
  //     'date': '2025-08-06',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Thursday',
  //     'date': '2025-08-07',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Friday',
  //     'date': '2025-08-08',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Saturday',
  //     'date': '2025-08-09',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Sunday',
  //     'date': '2025-08-10',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Monday',
  //     'date': '2025-08-11',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Tuesday',
  //     'date': '2025-08-12',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Wednesday',
  //     'date': '2025-08-13',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Thursday',
  //     'date': '2025-08-14',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Friday',
  //     'date': '2025-08-15',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Saturday',
  //     'date': '2025-08-16',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Sunday',
  //     'date': '2025-08-17',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Monday',
  //     'date': '2025-08-18',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Tuesday',
  //     'date': '2025-08-19',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Wednesday',
  //     'date': '2025-08-20',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Thursday',
  //     'date': '2025-08-21',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Friday',
  //     'date': '2025-08-22',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Saturday',
  //     'date': '2025-08-23',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Sunday',
  //     'date': '2025-08-24',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Monday',
  //     'date': '2025-08-25',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Tuesday',
  //     'date': '2025-08-26',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Wednesday',
  //     'date': '2025-08-27',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Thursday',
  //     'date': '2025-08-28',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Friday',
  //     'date': '2025-08-29',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Saturday',
  //     'date': '2025-08-30',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  //   {
  //     'day': 'Sunday',
  //     'date': '2025-08-31',
  //     'checkIn': null,
  //     'checkOut': null,
  //     'status': 'Absent',
  //     'workTime': 0,
  //     'progressValue': 0.0,
  //   },
  // ];

  // List<Attendance> get attendances =>
  //     _attendancesRaw.map((e) => Attendance.fromMap(e)).toList();

  final List<Attendance> _attendances = [];
  List<Attendance> get attendances => _attendances;

  // void doCheckIn(String date, String checkIn) {
  //   final index = _attendancesRaw.indexWhere((item) => item['date'] == date);
  //   if (index != -1) {
  //     final updated = Map<String, dynamic>.from(_attendancesRaw[index]);
  //     updated['checkIn'] = checkIn;
  //     updated['status'] = 'Present';
  //     _attendancesRaw[index] = updated;
  //     notifyListeners();
  //   }
  // }

  void doCheckIn() {
    Attendance newData = Attendance(
      day: '',
      date: nowDate,
      status: 'In Progress',
      checkIn: nowTime,
      checkOut: null,
      workTime: 0,
      progressValue: 0,
    );

    _attendances.add(newData);
    notifyListeners();
  }

  void doCheckOut(int workTime, double progressValue) {
    final index = _attendances.indexWhere((item) => item.date == nowDate);
    _attendances[index].workTime = workTime;
    _attendances[index].progressValue = progressValue;
    _attendances[index].checkOut = DateFormat('HH:mm').format(DateTime.now());
    _attendances[index].status = 'Present';

    notifyListeners();
  }

  // void doCheckOut(
  //   String date,
  //   String checkOut,
  //   int workTime,
  //   double progressValue,
  // ) {
  //   final index = _attendancesRaw.indexWhere((item) => item['date'] == date);
  //   if (index != -1) {
  //     final updated = Map<String, dynamic>.from(_attendancesRaw[index]);
  //     updated['checkOut'] = checkOut;
  //     updated['workTime'] = workTime;
  //     updated['progressValue'] = progressValue;
  //     _attendancesRaw[index] = updated;
  //     notifyListeners();
  //   }
  // }

  Attendance getAttendanceData() {
    final index = _attendances.indexWhere((item) => item.date == nowDate);

    if (index != -1) {
      return _attendances[index];
    } else {
      return Attendance(
        day: '',
        date: '',
        status: '',
        checkIn: null,
        checkOut: null,
        workTime: 0,
        progressValue: 0,
      );
    }
  }

  Attendance getDataByDate(String date) {
    // final raw = _attendancesRaw.firstWhere(
    //   (item) => item['date'] == date,
    //   orElse: () => {
    //     'day': '',
    //     'date': date,
    //     'checkIn': null,
    //     'checkOut': null,
    //     'status': '',
    //     'workTime': 0,
    //     'progressValue': 0.0,
    //   },
    // );

    //return Attendance.fromMap(raw);
    final raw = _attendances.firstWhere((item) => item.date == date);
    return Attendance.fromMap(raw as Map<String, dynamic>);
  }
}
