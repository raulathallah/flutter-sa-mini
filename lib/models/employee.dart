class Employee {
  String fullName;
  String position;
  String department;
  String workEmail;
  String personalEmail;
  String phone;
  String location;
  String? profilePhoto;

  //tambahan
  String nation;
  String joinDate;
  String employeeId;
  String employeeType;

  Employee({
    this.fullName = '',
    this.position = '',
    this.department = '',
    this.workEmail = '',
    this.personalEmail = '',
    this.phone = '',
    this.location = '',
    this.profilePhoto,
    this.nation = '',
    this.joinDate = '',
    this.employeeId = '',
    this.employeeType = '',
  });
}
