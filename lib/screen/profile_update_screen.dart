import 'package:flutter/material.dart';
import 'package:hr_attendance_tracker/providers/form_profile_providers.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProfileProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formProvider.formKey,
            child: Column(
              children: [
                //FULL NAME
                TextFormField(
                  controller: formProvider.fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                  autofillHints: [AutofillHints.name],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name!';
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
