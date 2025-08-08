import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';

class AttendanceScreen extends StatelessWidget {
  final Employee emp;

  const AttendanceScreen({super.key, required this.emp});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('MONTH CLICKED!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    child: Column(
                      children: [
                        Text('Month'),
                        Text(
                          '08',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      print('YEAR CLICKED!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                    child: Column(
                      children: [
                        Text('Year'),
                        Text(
                          '2025',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(child: buildListAttendance()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListAttendance() {
  final List<Map<String, dynamic>> items = [
    {
      'day': 'Friday',
      'date': '01',
      'checkIn': '08:37',
      'checkOut': '17:08',
      'status': 'Present',
    },
    {
      'day': 'Saturday',
      'date': '02',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Sunday',
      'date': '03',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Monday',
      'date': '04',
      'checkIn': '08:55',
      'checkOut': '16:42',
      'status': 'Present',
    },
    {
      'day': 'Tuesday',
      'date': '05',
      'checkIn': '07:47',
      'checkOut': '18:00',
      'status': 'Present',
    },
    {
      'day': 'Wednesday',
      'date': '06',
      'checkIn': '09:22',
      'checkOut': '16:54',
      'status': 'Present',
    },
    {
      'day': 'Thursday',
      'date': '07',
      'checkIn': '08:12',
      'checkOut': '17:26',
      'status': 'Present',
    },
    {
      'day': 'Friday',
      'date': '08',
      'checkIn': '08:59',
      'checkOut': '17:44',
      'status': 'Present',
    },
    {
      'day': 'Saturday',
      'date': '09',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Sunday',
      'date': '10',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Monday',
      'date': '11',
      'checkIn': '07:52',
      'checkOut': '17:15',
      'status': 'Present',
    },
    {
      'day': 'Tuesday',
      'date': '12',
      'checkIn': '08:43',
      'checkOut': '17:39',
      'status': 'Present',
    },
    {
      'day': 'Wednesday',
      'date': '13',
      'checkIn': '09:05',
      'checkOut': '16:58',
      'status': 'Present',
    },
    {
      'day': 'Thursday',
      'date': '14',
      'checkIn': '08:01',
      'checkOut': '17:47',
      'status': 'Present',
    },
    {
      'day': 'Friday',
      'date': '15',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Saturday',
      'date': '16',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Sunday',
      'date': '17',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Monday',
      'date': '18',
      'checkIn': '07:30',
      'checkOut': '17:55',
      'status': 'Present',
    },
    {
      'day': 'Tuesday',
      'date': '19',
      'checkIn': '08:18',
      'checkOut': '17:10',
      'status': 'Present',
    },
    {
      'day': 'Wednesday',
      'date': '20',
      'checkIn': '08:58',
      'checkOut': '17:26',
      'status': 'Present',
    },
    {
      'day': 'Thursday',
      'date': '21',
      'checkIn': '09:14',
      'checkOut': '16:45',
      'status': 'Present',
    },
    {
      'day': 'Friday',
      'date': '22',
      'checkIn': '08:24',
      'checkOut': '17:36',
      'status': 'Present',
    },
    {
      'day': 'Saturday',
      'date': '23',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Sunday',
      'date': '24',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Monday',
      'date': '25',
      'checkIn': '08:01',
      'checkOut': '17:02',
      'status': 'Present',
    },
    {
      'day': 'Tuesday',
      'date': '26',
      'checkIn': '08:44',
      'checkOut': '17:21',
      'status': 'Present',
    },
    {
      'day': 'Wednesday',
      'date': '27',
      'checkIn': '07:59',
      'checkOut': '17:33',
      'status': 'Present',
    },
    {
      'day': 'Thursday',
      'date': '28',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Friday',
      'date': '29',
      'checkIn': '08:36',
      'checkOut': '17:46',
      'status': 'Present',
    },
    {
      'day': 'Saturday',
      'date': '30',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
    {
      'day': 'Sunday',
      'date': '31',
      'checkIn': null,
      'checkOut': null,
      'status': 'Absent',
    },
  ];

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 2,
                height: 50, // specify height for vertical line
                color: items[index]['status'] == 'Present'
                    ? Colors.green[300]
                    : Colors.red[300],
                margin: EdgeInsets.symmetric(horizontal: 10),
              ),
              SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    Text(
                      '${items[index]['day']}, ${items[index]['date']}',
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
                      'In',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    Text(
                      items[index]['checkIn'] ?? '-- : --',
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
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    Text(
                      items[index]['checkOut'] ?? '-- : --',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 14),
                onPressed: () {
                  print('Icon pressed!');
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
