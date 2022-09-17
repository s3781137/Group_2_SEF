import 'package:flutter/material.dart';

// for test
var passwords = {"test": "Password123", "oli": "helloWorld!", "nic": "nic"};

class LoginHome extends StatelessWidget {
  const LoginHome();

  @override
  Widget build(BuildContext context) {
    return const LoginHomeScreen();
  }
}

class LoginHomeScreen extends StatelessWidget {
  const LoginHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TD TELEMEDICINE'),
        centerTitle: true,
      ),
      body: const Center(
        child: SizedBox(
          child: Card(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _validateForm() {
    String usernameString = _usernameTextController.value.text;
    String passwordString = _passwordTextController.value.text;

    if (passwords[usernameString] == passwordString) {
      Navigator.of(context).pushNamed('/patient');
      // todo: homescreen
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text('Cannot Sign in'),
                content: const Text('Username and Password do not match'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ]);
          });
    }
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _usernameTextController,
      _passwordTextController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1;
      }
    }
    progress = progress / controllers.length;

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        onChanged: _updateFormProgress, // NEW
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(value: _formProgress),
            Text('Patient Sign In',
                style: Theme.of(context).textTheme.headline4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _usernameTextController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passwordTextController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                }),
              ),
              onPressed: _formProgress == 1 ? _validateForm : null, // UPDATED
              child: const Text('         Sign            In          '),
            ),
            Padding(padding: EdgeInsets.all(20)),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                }),
              ),
              onPressed: () => Navigator.of(context).pushNamed('/choosesignup'),
              child: const Text('New Member? Sign Up! '),
            ),
            Padding(padding: EdgeInsets.all(20)),
          ],
        ),
      ),
    );
  }
}
