import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  final Employee emp;

  Profile({required this.emp});

  String formattedDate = DateFormat(
    'yyyy-MM-dd – kk:mm',
  ).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Profile', style: TextStyle(fontSize: 18)),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
          ],
        ),

        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileHeader(emp),
              buildWorkInfo(emp),
              buildEmployeeInfo(emp),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildFooter(),
    );
  }
}

Widget buildProfileHeader(Employee emp) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage('assets/images/pp.png'),
              ),
            ),

            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  emp.fullName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // HORIZONTAL DIVIDER
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 5),
                    //   width: 10, // 👈 short line
                    //   height: 1,
                    //   color: Colors.grey,
                    // ),
                    Text(emp.nation, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildWorkInfo(Employee emp) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      //borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 140,
          child: Column(
            children: [
              Icon(Icons.business_rounded, color: Colors.blue),
              SizedBox(height: 4),
              Text(emp.department, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),

        //DIVIDER
        Container(
          width: 1,
          height: 60,
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 36),
        ),

        Container(
          width: 140,
          child: Column(
            children: [
              Icon(Icons.assignment_ind, color: Colors.blue),
              SizedBox(height: 4),
              Text(
                emp.position,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildEmployeeInfo(Employee emp) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.blue),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employee Information',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID', style: TextStyle(color: Colors.white)),
                  Text(
                    emp.employeeId,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employment Type',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    emp.employeeType,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Joined Date', style: TextStyle(color: Colors.white)),
                  Text(
                    emp.joinDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone', style: TextStyle(color: Colors.white)),
                  Text(
                    emp.phone,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: TextStyle(color: Colors.white)),
                  Text(
                    emp.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildFooter() {
  return Container(
    color: Colors.blue,
    padding: EdgeInsets.all(20),
    child: Text(
      "HR Attendance Tracker v1.0",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12),
    ),
  );
}
