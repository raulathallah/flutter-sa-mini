import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/models/employee.dart';
import 'package:hr_attendance_tracker/providers/form_profile_providers.dart';
import 'package:hr_attendance_tracker/providers/profile_providers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  bool isLoading = false;
  File? _image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final formProviderTemp = Provider.of<FormProfileProviders>(
        context,
        listen: false,
      );
      setState(() {
        _image = File(pickedFile.path);
      });
      formProviderTemp.setProfilePhoto(pickedFile.path);
    }
  }

  @override
  void initState() {
    super.initState();

    final formProvider = Provider.of<FormProfileProviders>(
      context,
      listen: false,
    );
    final profileProvider = Provider.of<ProfileProviders>(
      context,
      listen: false,
    );

    formProvider.fullNameController.text = profileProvider.user.fullName;
    formProvider.positionController.text = profileProvider.user.position;
    formProvider.workEmailController.text = profileProvider.user.workEmail;
    formProvider.personalEmailController.text =
        profileProvider.user.personalEmail;
    formProvider.phoneController.text = profileProvider.user.phone;
    formProvider.locationController.text = profileProvider.user.location;

    formProvider.nationController.text = profileProvider.user.nation;
    formProvider.employeeIdController.text = profileProvider.user.employeeId;
    formProvider.employeeTypeController.text =
        profileProvider.user.employeeType;
    formProvider.setDepartment(profileProvider.user.department);
  }

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProfileProviders>(context);
    final profileProvider = Provider.of<ProfileProviders>(context);

    final phoneFormatter = MaskTextInputFormatter(
      mask: '+62 ###-####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    final departmentItems = ['IT Department', 'Finance Department'];
    String? selectedDepartment = profileProvider.user.department;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.blue))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Form(
                  key: formProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      //IMAGE
                      Column(
                        spacing: 6,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _image != null
                              ? Image.file(_image!, height: 140)
                              : Text("No image selected"),

                          ElevatedButton.icon(
                            icon: Icon(Icons.image),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                            ),
                            onPressed: () {
                              pickImage();
                            },
                            label: Text("Change profile picture"),
                          ),
                        ],
                      ),

                      //FULL NAME
                      TextFormField(
                        controller: formProvider.fullNameController,
                        decoration: InputDecoration(labelText: 'Full Name'),
                        autofillHints: [AutofillHints.name],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name!';
                          }

                          if (value.length < 3) {
                            return 'Minimum 3 characters!';
                          }

                          return null;
                        },
                      ),

                      //WORK EMAIL
                      TextFormField(
                        controller: formProvider.workEmailController,
                        decoration: InputDecoration(labelText: 'Work Email'),
                        autofillHints: [AutofillHints.email],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Work Email!';
                          }

                          return null;
                        },
                      ),

                      //PERSONAL EMAIL
                      TextFormField(
                        controller: formProvider.personalEmailController,
                        decoration: InputDecoration(
                          labelText: 'Personal Email',
                        ),
                        autofillHints: [AutofillHints.email],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Personal Email!';
                          }

                          return null;
                        },
                      ),

                      //PHONE
                      TextFormField(
                        controller: formProvider.phoneController,
                        inputFormatters: [phoneFormatter],
                        decoration: InputDecoration(labelText: 'Phone'),
                        autofillHints: [AutofillHints.telephoneNumberLocal],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Phone number!';
                          }

                          return null;
                        },
                      ),

                      //LOCATION
                      TextFormField(
                        controller: formProvider.locationController,
                        decoration: InputDecoration(labelText: 'Location'),
                        autofillHints: [AutofillHints.location],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Location!';
                          }

                          return null;
                        },
                      ),

                      //DEPARTMENT
                      DropdownButtonFormField<String>(
                        value: selectedDepartment,
                        decoration: InputDecoration(labelText: 'Department'),
                        items: departmentItems
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            formProvider.setDepartment(value);
                            selectedDepartment = value;
                          }
                        },
                        validator: (value) =>
                            value == null ? 'Please select a country' : null,
                      ),

                      //POSITION
                      TextFormField(
                        controller: formProvider.positionController,
                        decoration: InputDecoration(labelText: 'Position'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Position!';
                          }

                          return null;
                        },
                      ),

                      //EMPLOYEE ID
                      TextFormField(
                        controller: formProvider.employeeIdController,
                        decoration: InputDecoration(labelText: 'Employee ID'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Employee ID!';
                          }

                          return null;
                        },
                        enabled: false,
                      ),

                      //EMPLOYEE TYPE
                      TextFormField(
                        controller: formProvider.employeeTypeController,
                        decoration: InputDecoration(labelText: 'Employee Type'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Employee Type!';
                          }

                          return null;
                        },
                        enabled: false,
                      ),

                      SizedBox(height: 20),

                      //BUTTON
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 12,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),

                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                            ),

                            onPressed: () async {
                              if (formProvider.validateForm()) {
                                setState(() {
                                  isLoading = true; // Start loading
                                });

                                await Future.delayed(
                                  Duration(seconds: 2),
                                ); // simulate async

                                formProvider.saveForm();
                                await profileProvider.updateProfile(
                                  formProvider.formData,
                                );

                                setState(() {
                                  isLoading = false; // End loading
                                });

                                Navigator.pop(context, true);
                                formProvider.resetForm();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green[50],
                                    content: Text(
                                      'Profile updated successfully.',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                );
                                //print(formProvider.formData.toString());
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red[50],
                                    content: Text(
                                      'Oops! Please fill out all required fields correctly.',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                );
                              }
                            },

                            child: Text("Submit"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[50],
                              foregroundColor: Colors.red,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),

                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                            ),

                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: const Text("Discard changes?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        child: const Text("No"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            child: Text("Cancel"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
