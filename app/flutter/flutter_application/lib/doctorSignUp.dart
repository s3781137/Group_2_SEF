import 'package:flutter/material.dart';
import 'welcome.dart';

class DoctorSignUpScreen extends StatelessWidget {
  const DoctorSignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
