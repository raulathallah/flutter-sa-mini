import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/screen/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Employee emp = Employee(
    fullName: 'Dewi Lestari',
    position: 'Graphic Designer',
    department: 'Design Department',
    email: 'dewi.lestari@kreasi.id',
    phone: '+62 812-3456-7890',
    nation: 'Indonesia',
    location: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    profilePhoto: '',
    employeeId: "119203",
    employeeType: "Full Time",
    joinDate: "February-12-2025",
  );

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      title: 'HR Attendance Tracker',
      home: Profile(emp: emp),
    );
  }
}
