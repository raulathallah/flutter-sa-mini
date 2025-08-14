import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/widgets/appBar.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/providers/attendance_providers.dart';
import 'package:hr_attendance_tracker/screen/attendance_screen.dart';
import 'package:hr_attendance_tracker/screen/home_screen.dart';
import 'package:hr_attendance_tracker/screen/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProviders(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int? _fromIndex;

  Employee get emp => Employee(
    fullName: 'Raul Athallah',
    position: 'IT Developer',
    department: 'IT Department',
    workEmail: 'raul.athallah@solecode.id',
    personalEmail: 'raulathallah24@gmail.com',
    phone: '+62 812-3xxx-7xxx',
    location: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    nation: 'Indonesia',
    joinDate: '02 July 2021',
    employeeId: '11230',
    employeeType: 'Full Time',
    profilePhoto: '',
  );

  void _changeTab(int index) {
    setState(() {
      _fromIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  List<Widget> get _screens => [
    HomeScreen(emp: emp, onTabChange: _changeTab),
    AttendanceScreen(emp: emp),
    ProfileScreen(emp: emp),
  ];
  final List<String> _titles = ['Home', 'Attendance', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: _titles[_currentIndex],
        fromIndex: _fromIndex,
        onTabChange: _changeTab,
      ),
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
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
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
