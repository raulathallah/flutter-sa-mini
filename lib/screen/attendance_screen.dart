import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/attendance.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/providers/attendance_providers.dart';
import 'package:hr_attendance_tracker/widgets/date_custom.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatelessWidget {
  final Employee emp;

  const AttendanceScreen({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    final attendanceList = context.watch<AttendanceProviders>().attendances;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //CHILDREN
              Text('Attendance History', textAlign: TextAlign.center),
              Expanded(child: buildListAttendance(attendanceList)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListAttendance(List<Attendance> items) {
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 3,
                height: 75, // specify height for vertical line

                color: getAttendanceColor(items[index].status),
                margin: EdgeInsets.symmetric(horizontal: 5),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      Text(
                        toDateString(items[index].date),
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              items[index].checkIn ?? '-- : --',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Out',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              items[index].checkOut ?? '-- : --',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Work Time',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              '${items[index].workTime.toString()} minutes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // IconButton(
              //   icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
              //   onPressed: () {
              //     DateTime now = DateTime.now();
              //     DateTime itemDate = DateFormat(
              //       'yyyy-MM-dd',
              //     ).parse(items[index].date);

              //     if (now.year == itemDate.year &&
              //         now.month == itemDate.month &&
              //         now.day == itemDate.day) {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (_) =>
              //               AttendanceCheckScreen(date: items[index].date),
              //         ),
              //       );
              //     } else {
              //       showNotificationToast(
              //         'Oops! This attendance is not for today.',
              //       );
              //     }
              //   },
              // ),
            ],
          ),
        ),
      );
    },
  );
}

Color? getAttendanceColor(String status) {
  if (status == 'Present') return Colors.green[300];
  if (status == 'In Progress') return Colors.blue;
  return Colors.red;
}
