import 'package:flutter/material.dart';
import 'package:flutter_application/patient/model/patient_profile_model.dart';

import '../../main.dart';
import '../core/api_patient.dart';
import '../patient.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  int? id = -1;
  Future<void> updateProfile(dynamic username) async {
    id = await _apiClient.getUserId(username);
    PatientProfileModel profile = PatientProfileModel(
        id: id,
        gender: genderController.text,
        weight: double.parse(weightController.text),
        height: double.parse(heightController.text),
        contactNo: contactNoController.text,
        contactName: contactNameController.text);
    dynamic res = await _apiClient.updateProfile(profile);
    // todo debug msg
    print(res);
    if (res.toString().contains("health information registered")) {
      print("updated health info for :${id}");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text('Update Success'),
                content: const Text('Your Profile has been updated'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Patient())),
                    child: const Text('OK'),
                  ),
                ]);
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text('Update Failure'),
                content: const Text('Cannot update profile'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ND TELEMEDICINE'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: PopupMenuButton(
                  child: Icon(Icons.account_circle),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'logout',
                        child: Text('Log out'),
                      ),
                      const PopupMenuItem(
                        value: 'changePW',
                        child: Text('Change Password'),
                      ),
                      const PopupMenuItem(
                        value: 'rmAccount',
                        child: Text('Delete account'),
                      ),
                    ];
                  },
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Patient()));
                  },
                  child: const Icon(Icons.home),
                )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Manage Profile',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: heightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: contactNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: contactNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Name',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Update'),
                      onPressed: () {
                        updateProfile(currentLoggedInUser["username"]);
                        // todo debug message
                        print(genderController.text);
                        print(weightController.text);
                        print(heightController.text);
                        print(contactNoController.text);
                        print(contactNameController.text);
                      },
                    )),
              ],
            )));
  }
}
