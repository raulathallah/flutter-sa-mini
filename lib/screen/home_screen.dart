import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final Employee emp;

  HomeScreen({super.key, required this.emp});

  String formattedDate = DateFormat(
    'yyyy-MM-dd – kk:mm',
  ).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HEADER CARD
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'PeopleTrack Solution',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
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
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),

                        CircleAvatar(
                          radius: 38,
                          backgroundImage: AssetImage(
                            'assets/images/pp_raul.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Overview',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'HR Attendance Tracker is a simple, efficient app that helps HR teams monitor employee attendance, track hours, manage leave, and generate reports. It streamlines timekeeping, improves accuracy, and reduces admin work for businesses of all sizes.',
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
