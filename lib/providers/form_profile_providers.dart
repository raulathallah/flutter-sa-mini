import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:intl/intl.dart';

class FormProfileProviders with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  Employee formData = Employee();

  // Controllers
  final fullNameController = TextEditingController();
  final positionController = TextEditingController();
  final departmentController = TextEditingController();
  final workEmailController = TextEditingController();
  final personalEmailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final profilePhotoController = TextEditingController();
  final nationController = TextEditingController();

  void setFullName(String value) {
    formData.fullName = value;
    notifyListeners();
  }

  void setPosition(String value) {
    formData.position = value;
    notifyListeners();
  }

  void setDepartment(String value) {
    formData.department = value;
    notifyListeners();
  }

  void setWorkEmail(String value) {
    formData.workEmail = value;
    notifyListeners();
  }

  void setPersonalEmail(String value) {
    formData.personalEmail = value;
    notifyListeners();
  }

  void setPhone(String value) {
    formData.phone = value;
    notifyListeners();
  }

  void setLocation(String value) {
    formData.location = value;
    notifyListeners();
  }

  void setProfilePhoto(String value) {
    formData.profilePhoto = value;
    notifyListeners();
  }

  void setNation(String value) {
    formData.nation = value;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void saveForm() {
    formData.fullName = fullNameController.text;
    formData.position = positionController.text;
    formData.department = departmentController.text;
    formData.workEmail = workEmailController.text;
    formData.personalEmail = personalEmailController.text;
    formData.phone = phoneController.text;
    formData.location = locationController.text;
    formData.profilePhoto = profilePhotoController.text;
    formData.nation = nationController.text;
  }

  void resetForm() {
    formData = Employee();
    fullNameController.clear();
    positionController.clear();
    departmentController.clear();
    workEmailController.clear();
    personalEmailController.clear();
    phoneController.clear();
    locationController.clear();
    profilePhotoController.clear();
    nationController.clear();
    notifyListeners();
  }
}
