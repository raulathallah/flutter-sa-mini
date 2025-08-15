import 'package:flutter/foundation.dart';
import 'package:hr_attendance_tracker/models/attendance.dart';

class AttendanceProviders extends ChangeNotifier {
  static final List<Map<String, dynamic>> _attendancesRaw = [
    {
      'day': 'Friday',
      'date': '2025-08-01',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0, // int
      'progressValue': 0.0, // double
    },
    {
      'day': 'Saturday',
      'date': '2025-08-02',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Sunday',
      'date': '2025-08-03',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Monday',
      'date': '2025-08-04',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Tuesday',
      'date': '2025-08-05',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Wednesday',
      'date': '2025-08-06',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Thursday',
      'date': '2025-08-07',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Friday',
      'date': '2025-08-08',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Saturday',
      'date': '2025-08-09',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Sunday',
      'date': '2025-08-10',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Monday',
      'date': '2025-08-11',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Tuesday',
      'date': '2025-08-12',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Wednesday',
      'date': '2025-08-13',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Thursday',
      'date': '2025-08-14',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Friday',
      'date': '2025-08-15',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Saturday',
      'date': '2025-08-16',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Sunday',
      'date': '2025-08-17',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Monday',
      'date': '2025-08-18',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Tuesday',
      'date': '2025-08-19',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Wednesday',
      'date': '2025-08-20',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Thursday',
      'date': '2025-08-21',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Friday',
      'date': '2025-08-22',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Saturday',
      'date': '2025-08-23',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Sunday',
      'date': '2025-08-24',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Monday',
      'date': '2025-08-25',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Tuesday',
      'date': '2025-08-26',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Wednesday',
      'date': '2025-08-27',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Thursday',
      'date': '2025-08-28',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Friday',
      'date': '2025-08-29',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Saturday',
      'date': '2025-08-30',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
    {
      'day': 'Sunday',
      'date': '2025-08-31',
      'checkIn': null,
      'checkOut': null,
      'status': '',
      'workTime': 0,
      'progressValue': 0.0,
    },
  ];

  List<Attendance> get attendances =>
      _attendancesRaw.map((e) => Attendance.fromMap(e)).toList();

  void doCheckIn(String date, String checkIn) {
    final index = _attendancesRaw.indexWhere((item) => item['date'] == date);
    if (index != -1) {
      final updated = Map<String, dynamic>.from(_attendancesRaw[index]);
      updated['checkIn'] = checkIn;
      updated['status'] = 'Present';
      _attendancesRaw[index] = updated;
      notifyListeners();
    }
  }

  void doCheckOut(
    String date,
    String checkOut,
    int workTime,
    double progressValue,
  ) {
    final index = _attendancesRaw.indexWhere((item) => item['date'] == date);
    if (index != -1) {
      final updated = Map<String, dynamic>.from(_attendancesRaw[index]);
      updated['checkOut'] = checkOut;
      updated['workTime'] = workTime;
      updated['progressValue'] = progressValue;
      _attendancesRaw[index] = updated;
      notifyListeners();
    }
  }

  Attendance getDataByDate(String date) {
    final raw = _attendancesRaw.firstWhere(
      (item) => item['date'] == date,
      orElse: () => {
        'day': '',
        'date': date,
        'checkIn': null,
        'checkOut': null,
        'status': '',
        'workTime': 0,
        'progressValue': 0.0,
      },
    );

    return Attendance.fromMap(raw);
  }
}
