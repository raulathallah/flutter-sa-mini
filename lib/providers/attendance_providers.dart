import 'package:flutter/foundation.dart';

class AttendanceProviders extends ChangeNotifier {
  final List<Map<String, dynamic>> _attendances = [
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

  void doCheckIn(String date, String checkIn) {
    int index = _attendances.indexWhere((item) => item['date'] == date);
    if (index != -1) {
      _attendances[index]['checkIn'] = checkIn;
    }

    notifyListeners();
  }

  void doCheckOut(
    String date,
    String checkOut,
    int workProgress,
    double progressValue,
  ) {
    int index = _attendances.indexWhere((item) => item['date'] == date);
    if (index != -1) {
      _attendances[index]['checkOut'] = checkOut;
      _attendances[index]['status'] = 'Present';
      _attendances[index]['workTime'] = workProgress;
      _attendances[index]['progressValue'] = progressValue;
    }

    notifyListeners();
  }

  Map<String, dynamic> getDataByDate(String date) {
    int index = _attendances.indexWhere((item) => item['date'] == date);
    return _attendances[index];
  }

  List<Map<String, dynamic>> get attendances => _attendances;
}
