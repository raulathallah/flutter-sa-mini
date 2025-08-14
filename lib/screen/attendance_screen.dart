import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/providers/attendance_providers.dart';
import 'package:hr_attendance_tracker/screen/attendance_check_screen.dart';
import 'package:hr_attendance_tracker/widgets/custom_notifications.dart';
import 'package:hr_attendance_tracker/widgets/date_custom.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatelessWidget {
  final Employee emp;

  const AttendanceScreen({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    final attendanceList = context.watch<AttendanceProviders>().attendances;

    print(context.watch<AttendanceProviders>().getDataByDate('2025-08-14'));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //CHILDREN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('MONTH CLICKED!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    child: Column(
                      children: [
                        Text('Month'),
                        Text(
                          '08',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      print('YEAR CLICKED!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    child: Column(
                      children: [
                        Text('Year'),
                        Text(
                          '2025',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: buildListAttendance(attendanceList)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListAttendance(List<Map<String, dynamic>> items) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 3,
                height: 50, // specify height for vertical line
                color: items[index]['status'] == 'Present'
                    ? Colors.green[300]
                    : Colors.red[300],
                margin: EdgeInsets.symmetric(horizontal: 5),
              ),

              Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 12, color: Colors.black45),
                        ),
                        Text(
                          toDateString(items[index]['date']),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 70,
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
                              items[index]['checkIn'] ?? '-- : --',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
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
                              'Out',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              items[index]['checkOut'] ?? '-- : --',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                onPressed: () {
                  DateTime now = DateTime.now();
                  DateTime itemDate = DateFormat(
                    'yyyy-MM-dd',
                  ).parse(items[index]['date']);

                  if (now.year == itemDate.year &&
                      now.month == itemDate.month &&
                      now.day == itemDate.day) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AttendanceCheckScreen(date: items[index]['date']),
                      ),
                    );
                  } else {
                    showNotificationToast(
                      'Oops! This attendance is not for today.',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
