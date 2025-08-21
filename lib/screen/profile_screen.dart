import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/screen/profile_update_screen.dart';

class ProfileScreen extends StatelessWidget {
  final black_custom = Colors.black12;
  final Employee emp;

  ProfileScreen({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProfileHeader(context, emp),
                SizedBox(height: 8),
                buildEmailInfo(emp),
                Divider(height: 0.1, color: black_custom),
                buildContactInfo(emp),
                Divider(height: 0.1, color: black_custom),
                buildWorkInfo(emp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildProfileHeader(BuildContext context, Employee emp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/pp_raul.jpg'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emp.fullName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(emp.nation, style: TextStyle(fontSize: 12))],
              ),
            ],
          ),

          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileUpdateScreen()),
              );
            },
          ),
        ],
      ),
    ],
  );
}

Widget buildContactInfo(Employee emp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 15,
    children: [
      Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.phone, color: Colors.blue, size: 18),
          ),
          Text('Contact', style: TextStyle(fontSize: 14)),
        ],
      ),
      buildCustomTile('Phone', emp.phone),
    ],
  );
}

Widget buildEmailInfo(Employee emp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 15,
    children: [
      Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.email_outlined, color: Colors.blue, size: 18),
          ),
          Text('Email', style: TextStyle(fontSize: 14)),
        ],
      ),
      buildCustomTile('Official', emp.workEmail),
      buildCustomTile('Personal', emp.personalEmail),
    ],
  );
}

Widget buildWorkInfo(Employee emp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 15,
    children: [
      Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.work_outline, color: Colors.blue, size: 18),
          ),
          Text('Work', style: TextStyle(fontSize: 14)),
        ],
      ),

      buildCustomTile('Employee ID', emp.employeeId),
      buildCustomTile('Employee Type', emp.employeeType),
      buildCustomTile('Join Date', emp.joinDate),
      buildCustomTile('Position', emp.position),
      buildCustomTile('Department', emp.department),
    ],
  );
}

Widget buildEmployeeInfo(Employee emp) {
  return Container(padding: EdgeInsets.all(20), child: null);
}

Widget buildCustomTile(String title, String value) {
  return Padding(
    padding: EdgeInsets.only(left: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(title, style: TextStyle(fontSize: 12, color: Colors.black45)),
        Text(value, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}
