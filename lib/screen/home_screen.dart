import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
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
                            buttonCustom(
                              'My Attendance',
                              Icons.date_range_outlined,
                              () => onTabChange!(1),
                            ),
                            buttonCustom(
                              'My Profile',
                              Icons.person,
                              () => onTabChange!(2),
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
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Change radius here
      ),
      backgroundColor: Colors.blue[50],
      foregroundColor: Colors.blue,
      elevation: 0,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ), // Optional padding
    ),
  );
}
