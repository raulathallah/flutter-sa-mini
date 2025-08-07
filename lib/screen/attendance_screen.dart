import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';

class AttendanceScreen extends StatelessWidget {
  final Employee emp;

  AttendanceScreen({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //CHILDREN
            ],
          ),
        ),
      ),
    );
  }
}
