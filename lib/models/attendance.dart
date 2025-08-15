class Attendance {
  final String day;
  final String date;
  String? checkIn;
  String? checkOut;
  String status;
  int workTime;
  double progressValue;

  Attendance({
    required this.day,
    required this.date,
    this.checkIn,
    this.checkOut,
    required this.status,
    required this.workTime,
    required this.progressValue,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      day: map['day'],
      date: map['date'],
      checkIn: map['checkIn'],
      checkOut: map['checkOut'],
      status: map['status'],
      workTime: map['workTime'],
      progressValue: map['progressValue'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'date': date,
      'checkIn': checkIn,
      'checkOut': checkOut,
      'status': status,
      'workTime': workTime,
      'progressValue': progressValue,
    };
  }
}
