import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/button.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final Employee emp;
  final void Function(int)? onTabChange;

  HomeScreen({super.key, required this.emp, required this.onTabChange});

  String formattedDate = DateFormat(
    'yyyy-MM-dd – kk:mm',
  ).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              spacing: 15,
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

                    CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage('assets/images/pp_raul.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 50),
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
