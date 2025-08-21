import 'package:flutter/foundation.dart';
import 'package:hr_attendance_tracker/models/employee.dart';

class ProfileProviders extends ChangeNotifier {
  final Employee _user = Employee(
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

  Employee get user => _user;

  void updateFullName(String value) {
    _user.fullName = value;
    notifyListeners();
  }

  void updatePosition(String value) {
    _user.position = value;
    notifyListeners();
  }

  void updateDepartment(String value) {
    _user.department = value;
    notifyListeners();
  }

  void updateWorkEmail(String value) {
    _user.workEmail = value;
    notifyListeners();
  }

  void updatePersonalEmail(String value) {
    _user.personalEmail = value;
    notifyListeners();
  }

  void updatePhone(String value) {
    _user.phone = value;
    notifyListeners();
  }

  void updateLocation(String value) {
    _user.location = value;
    notifyListeners();
  }

  void updateNation(String value) {
    _user.nation = value;
    notifyListeners();
  }

  void updateProfilePhoto(String value) {
    _user.profilePhoto = value;
    notifyListeners();
  }
}
