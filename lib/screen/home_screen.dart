import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/button.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/providers/attendance_providers.dart';
import 'package:hr_attendance_tracker/widgets/custom_notifications.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final Employee emp;
  final void Function(int)? onTabChange;

  HomeScreen({super.key, required this.emp, required this.onTabChange});

  String formattedDate = DateFormat(
    'yyyy-MM-dd – kk:mm',
  ).format(DateTime.now());

  String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateFormat timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    var attendanceController = context.read<AttendanceProviders>();

    final attendanceData = attendanceController.getAttendanceData();

    double progressValue = attendanceData.progressValue != 0
        ? attendanceData.progressValue
        : 0;

    int currentProgress = attendanceData.workTime != 0
        ? attendanceData.workTime
        : 0;

    if (attendanceData.checkIn != null && attendanceData.checkOut == null) {
      int maxWorkMinutes = 8 * 60;
      DateTime now = DateTime.now();

      String checkInCombined =
          '${attendanceData.date} ${attendanceData.checkIn}';
      DateFormat format = DateFormat("yyyy-MM-dd HH:mm");
      DateTime checkInForProgress = format.parse(checkInCombined);

      currentProgress = now.difference(checkInForProgress).inMinutes;
      currentProgress = currentProgress.clamp(0, maxWorkMinutes).toInt();

      progressValue = currentProgress / maxWorkMinutes;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PeopleTrack Solution',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        Text(
                          'Welcome, ${emp.fullName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          emp.position,
                          style: TextStyle(fontSize: 14, color: Colors.black38),
                        ),

                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              style: AppButtonStyles.primary,
                              onPressed: () => onTabChange!(1),
                              icon: Icon(
                                Icons.date_range_outlined,
                                color: Colors.blue,
                              ), // Your icon
                              label: Text('Attendance'),
                            ),
                            ElevatedButton.icon(
                              style: AppButtonStyles.primary,
                              onPressed: () => onTabChange!(2),
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ), // Your icon
                              label: Text('Profile'),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // CircleAvatar(
                    //   radius: 48,
                    //   backgroundImage: AssetImage('assets/images/pp_raul.jpg'),
                    // ),
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: FileImage(
                        File(
                          emp.profilePhoto!,
                        ), // Make sure it's not null or empty
                      ),
                    ),
                  ],
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Column(
                      children: [
                        attendanceData.checkIn != null
                            ? Column(
                                spacing: 12,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8,
                                    children: [
                                      Text(
                                        "Today's work",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '$currentProgress minutes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      LinearProgressIndicator(
                                        value:
                                            progressValue, // value between 0.0 and 1.0
                                        backgroundColor: Colors.blue[200],
                                        minHeight: 12,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    spacing: 12,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'In',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  attendanceData.checkIn ??
                                                      '-- : --',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            width: 70,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Out',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  attendanceData.checkOut ??
                                                      '-- : --',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
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
                                ],
                              )
                            : Text(
                                "You haven’t checked in today.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                        SizedBox(height: 12),
                        Row(
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            attendanceData.checkIn == null
                                ? Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: attendanceData.checkIn == null
                                          ? () {
                                              attendanceController.doCheckIn();
                                              onTabChange!(1);
                                              showNotificationSnackBar(
                                                context,
                                                "Check In Successful!",
                                              );
                                            }
                                          : null,

                                      style: AppButtonStyles.secondary,
                                      icon: Icon(
                                        Icons.arrow_downward,
                                        size: 24,
                                      ),
                                      label: Text('Check In'),
                                    ),
                                  )
                                : Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed:
                                          attendanceData.checkIn != null &&
                                              attendanceData.checkOut == null
                                          ? () {
                                              attendanceController.doCheckOut(
                                                currentProgress,
                                                progressValue,
                                              );
                                              onTabChange!(1);
                                              showNotificationSnackBar(
                                                context,
                                                "Check Out Successful!",
                                              );
                                            }
                                          : null,
                                      icon: Icon(Icons.arrow_upward, size: 24),
                                      style: AppButtonStyles.secondary,
                                      label: Text('Check Out'),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.assignment_turned_in_sharp,
                      color: Colors.blue,
                      size: 50,
                    ),
                    Text(
                      'App Overview',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'HR Attendance Tracker is a simple, efficient app that helps HR teams monitor employee attendance, track hours, manage leave, and generate reports. It streamlines timekeeping, improves accuracy, and reduces admin work for businesses of all sizes.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buttonCustom(String title, IconData icon, Function? onPressed) {
  return ElevatedButton.icon(
    onPressed: () {
      onPressed!();
    },
    icon: Icon(icon),
    label: Text(title, style: TextStyle(fontSize: 12)),
    style: AppButtonStyles.primary,
  );
}
