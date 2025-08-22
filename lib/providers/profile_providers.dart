import 'package:flutter/foundation.dart';
import 'package:hr_attendance_tracker/models/employee.dart';

class ProfileProviders extends ChangeNotifier {
  Employee _user = Employee(
    fullName: 'Raul Athallah',
    position: 'IT Developer',
    department: 'IT Department',
    workEmail: 'raul.athallah@solecode.id',
    personalEmail: 'raulathallah24@gmail.com',
    phone: '+62 812-9302-9130',
    location: 'Jl. Melati No. 10, Bandung, Jawa Barat',
    nation: 'Indonesia',
    joinDate: '',
    employeeId: '11230',
    employeeType: 'Full Time',
    profilePhoto: '',
  );

  Employee get user => _user;

  Future<void> updateProfile(Employee newData) {
    _user = newData;
    notifyListeners();
    return Future.value();
  }
}
