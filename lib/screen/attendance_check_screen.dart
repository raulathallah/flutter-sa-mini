import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/button.dart';
import 'package:hr_attendance_tracker/providers/attendance_providers.dart';
import 'package:hr_attendance_tracker/widgets/custom_notifications.dart';
import 'package:hr_attendance_tracker/widgets/date_custom.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class AttendanceCheckScreen extends StatelessWidget {
  final String date;
  const AttendanceCheckScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    var attendanceController = context.read<AttendanceProviders>();
    final attendanceData = attendanceController.getDataByDate(date);

    DateFormat timeFormat = DateFormat('HH:mm');
    var timeNow = timeFormat.format(DateTime.now());

    String minutes = '0';
    double progressValue = attendanceData.progressValue ?? 0;
    int currentProgress = attendanceData.workTime ?? 0;

    if (attendanceData.checkIn != null && attendanceData.checkOut != null) {
      DateTime checkInTime = timeFormat.parse(
        attendanceData.checkIn.toString(),
      );
      DateTime checkOutTime = timeFormat.parse(
        attendanceData.checkOut.toString(),
      );

      Duration duration = checkOutTime.difference(checkInTime);
      minutes = duration.inMinutes.toString();
    }

    if (attendanceData.checkIn != null && attendanceData.checkOut == null) {
      int maxWorkMinutes = 8 * 60;
      DateTime now = DateTime.now();

      String checkInCombined =
          '${attendanceData.date} ${attendanceData.checkIn}';

      DateTime checkInForProgress = DateTime.parse(checkInCombined);

      currentProgress = now.difference(checkInForProgress).inMinutes;
      currentProgress = currentProgress.clamp(0, maxWorkMinutes).toInt();

      progressValue = currentProgress / maxWorkMinutes;

      print('currentProgress: $currentProgress');
      // print('maxWorkMinutes: $maxWorkMinutes');
      // print('checkInCombined: $checkInCombined');
      // print('checkInForProgress: $checkInForProgress');
      // print('Now: $now');
      print('progressValue: $progressValue');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Check In/Out'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time Now',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
                Text(
                  timeNow,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text(
                  'Work Progress',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
                Text(
                  '$currentProgress minutes',
                  style: TextStyle(fontSize: 16),
                ),
                LinearProgressIndicator(
                  value: progressValue, // value between 0.0 and 1.0
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
              ],
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
                        toDateString(attendanceData.date),
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
                            attendanceData.checkIn ?? '-- : --',
                            style: TextStyle(fontSize: 14, color: Colors.black),
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
                            attendanceData.checkOut ?? '-- : --',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: attendanceData.checkIn == null
                        ? () {
                            attendanceController.doCheckIn();
                            Navigator.pop(context);
                            showNotificationSnackBar(
                              context,
                              "Check In Successful!",
                            );
                          }
                        : null,

                    style: AppButtonStyles.secondary,
                    icon: Icon(Icons.arrow_downward, size: 24),
                    label: Text('Check In'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed:
                        attendanceData.checkIn != null &&
                            attendanceData.checkOut == null
                        ? () {
                            attendanceController.doCheckOut(
                              currentProgress,
                              progressValue,
                            );
                            Navigator.pop(context);
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
    );
  }
}
