import 'dart:convert';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  Doctor(this.jwt, this.payload);

  factory Doctor.fromBase64(String jwt) => Doctor(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo appbar
      // appBar: makeAppBar(context, jwt),
      body: ListView(
        children: <Widget>[
          ListTile(
            // todo: icon
            // leading: CircleAvatar(
            //   backgroundImage: AssetImage('assets/ManageProfile.png'),
            // ),
            title: const Text('Create Doctor'),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => CreateDoctor.fromBase64(jwt)));
            },
          ),
          ListTile(
            // todo: icon
            // leading: CircleAvatar(
            //   backgroundImage: AssetImage('assets/ManageProfile.png'),
            // ),
            title: const Text('Update Doctor'),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => UpdateDoctorScreen.fromBase64(jwt)));
            },
          ),
          ListTile(
            // todo: icon
            // leading: CircleAvatar(
            //   backgroundImage: AssetImage('assets/ManageProfile.png'),
            // ),
            title: const Text('Delete Doctor'),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => DeleteDoctorScreen.fromBase64(jwt)));
            },
          ),
        ],
      ),
    );
  }
}
