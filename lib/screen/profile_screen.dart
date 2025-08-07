import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';

class ProfileScreen extends StatelessWidget {
  final black_custom = Colors.black12;
  final Employee emp;

  ProfileScreen({required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProfileHeader(emp),
                SizedBox(height: 8),
                buildContactInfo(emp),
                Divider(height: 0.1, color: black_custom),
                buildWorkInfo(emp),
                buildEmployeeInfo(emp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildProfileHeader(Employee emp) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
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
      Text('Contact', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.phone_outlined, color: Colors.blue, size: 18),
          ),
          Text(emp.phone, style: TextStyle(fontSize: 14)),
        ],
      ),
      Row(
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.email_outlined, color: Colors.blue, size: 18),
          ),
          Text(emp.email, style: TextStyle(fontSize: 14)),
        ],
      ),
    ],
  );
}

Widget buildWorkInfo(Employee emp) {
  return Container(
    padding: EdgeInsets.all(0),
    child: Row(children: []),
  );
}

Widget buildEmployeeInfo(Employee emp) {
  return Container(padding: EdgeInsets.all(20), child: null);
}
