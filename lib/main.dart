import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/components/appBar.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/screen/attendance_screen.dart';
import 'package:hr_attendance_tracker/screen/home_screen.dart';
import 'package:hr_attendance_tracker/screen/profile_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      title: 'HR Attendance Tracker',
      //home: Profile(emp: emp),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  Employee get emp => Employee(
    fullName: 'Raul Athallah',
    position: 'IT Developer',
    department: 'IT Department',
    email: 'raulathallah24@gmail.com',
    phone: '+62 812-3xxx-7xxx',
    location: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    nation: 'Indonesia',
    joinDate: '02 July 2021',
    employeeId: '11230',
    employeeType: 'Full Time',
    profilePhoto: '',
  );

  void _changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  List<Widget> get _screens => [
    HomeScreen(emp: emp),
    AttendanceScreen(emp: emp),
    ProfileScreen(emp: emp),
  ];
  final List<String> _titles = ['Home', 'Attendance', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: _titles[_currentIndex]),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _screens[_currentIndex],
            ),
          ),
          buildFooter(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _changeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

Widget buildFooter() {
  return Container(
    padding: const EdgeInsets.all(8),
    color: Colors.grey[50],
    width: double.infinity,
    child: Text(
      'HR Attendance Tracker v1.0',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: Colors.black54),
    ),
  );
}
